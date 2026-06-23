import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/providers/app_providers.dart';
import '../data/settings_repository_impl.dart';

final _settingsRepositoryProvider = Provider<SettingsRepositoryImpl>((ref) {
  return SettingsRepositoryImpl(ref.watch(databaseProvider));
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () => context.go('/dashboard'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              value: true,
              onChanged: null,
              title: const Text('On-device processing'),
              subtitle: const Text('Cloud upload is disabled by design'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.ios_share),
              title: const Text('Export Data'),
              subtitle: const Text('CSV with aggregate daily metrics'),
              onTap: () async {
                final path = await ref.read(_settingsRepositoryProvider).exportCsv();
                await SharePlus.instance.share(ShareParams(files: [XFile(path)]));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.restart_alt),
              title: const Text('Reset Baseline'),
              onTap: () async {
                await ref.read(_settingsRepositoryProvider).resetBaseline();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Baseline reset')));
                }
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
              title: const Text('Delete Data'),
              subtitle: const Text('Removes local metrics, baselines, and predictions'),
              onTap: () => _confirmDelete(context, ref),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete local health data?'),
        content: const Text('This cannot be undone. AuraVitals will begin calibration again.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Delete')),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(_settingsRepositoryProvider).deleteData();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Local data deleted')));
    }
  }
}
