import 'package:flutter/material.dart';

class CalibrationProgressView extends StatelessWidget {
  const CalibrationProgressView({
    required this.daysCollected,
    required this.accuracy,
    super.key,
  });

  final int daysCollected;
  final double accuracy;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day $daysCollected of 14', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: accuracy),
            const SizedBox(height: 8),
            Text('Baseline Accuracy ${(accuracy * 100).round()}%'),
          ],
        ),
      ),
    );
  }
}
