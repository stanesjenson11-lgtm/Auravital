import 'package:flutter/material.dart';

class RiskBadge extends StatelessWidget {
  const RiskBadge({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final high = value >= 70;
    return Chip(
      avatar: Icon(
        high ? Icons.warning_amber : Icons.check_circle,
        color: high ? scheme.error : scheme.primary,
      ),
      label: Text('$label ${value.round()}%'),
      side: BorderSide(color: high ? scheme.error : scheme.outlineVariant),
    );
  }
}
