import 'package:flutter/material.dart';

class NotificationPreferencesPanel extends StatelessWidget {
  const NotificationPreferencesPanel({
    required this.enabled,
    required this.onChanged,
    super.key,
  });

  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SwitchListTile(
        value: enabled,
        onChanged: onChanged,
        title: const Text('Risk Notifications'),
        subtitle: const Text('Throttled local alerts for meaningful risk changes'),
      ),
    );
  }
}
