import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/app_providers.dart';
import '../domain/aura_permission_status.dart';

final permissionStatusProvider = FutureProvider.autoDispose<AuraPermissionStatus>((ref) {
  return ref.watch(permissionRepositoryProvider).status();
});

class PermissionsScreen extends ConsumerWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(permissionStatusProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Permissions')),
      body: status.when(
        data: (value) => RefreshIndicator(
          onRefresh: () => ref.refresh(permissionStatusProvider.future),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _PermissionTile(
                title: 'Activity Recognition',
                subtitle: 'Steps, walking time, and sedentary duration',
                granted: value.activityRecognition,
                action: () async {
                  await ref.read(permissionRepositoryProvider).requestRuntimePermissions();
                  ref.invalidate(permissionStatusProvider);
                },
              ),
              _PermissionTile(
                title: 'Notifications',
                subtitle: 'Private risk alerts generated on-device',
                granted: value.notifications,
                action: () async {
                  await ref.read(permissionRepositoryProvider).requestRuntimePermissions();
                  ref.invalidate(permissionStatusProvider);
                },
              ),
              _PermissionTile(
                title: 'Usage Access',
                subtitle: 'Aggregate screen time, unlocks, and night usage',
                granted: value.usageAccess,
                action: () async {
                  await ref.read(permissionRepositoryProvider).openUsageAccessSettings();
                },
              ),
              _PermissionTile(
                title: 'Battery Optimization',
                subtitle: 'Allows scheduled monitoring to keep running',
                granted: value.batteryUnrestricted,
                action: () async {
                  await ref.read(permissionRepositoryProvider).openBatteryOptimizationSettings();
                },
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: value.ready ? () => context.go('/dashboard') : null,
                icon: const Icon(Icons.monitor_heart),
                label: const Text('Start AuraVitals'),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Permission check failed: $error')),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.title,
    required this.subtitle,
    required this.granted,
    required this.action,
  });

  final String title;
  final String subtitle;
  final bool granted;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(granted ? Icons.verified : Icons.error_outline, color: granted ? scheme.primary : scheme.error),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: granted ? const Text('Enabled') : TextButton(onPressed: action, child: const Text('Enable')),
      ),
    );
  }
}
