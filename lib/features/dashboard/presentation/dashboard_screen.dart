import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/data/local/app_database.dart';
import '../../../shared/widgets/metric_card.dart';
import '../../../shared/widgets/section_header.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(monitoringCycleProvider);
    final metrics = ref.watch(latestMetricsProvider);
    final predictions = ref.watch(latestPredictionsProvider);
    final calibration = ref.watch(calibrationProvider);
    final recommendations = ref.watch(recommendationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AuraVitals'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () => context.go('/settings'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(monitoringCycleProvider);
          await ref.read(monitoringCycleProvider.future);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            predictions.when(
              data: (items) => _WellnessHero(prediction: items.isEmpty ? null : items.first),
              loading: () => const _LoadingCard(height: 190),
              error: (error, stack) => _ErrorCard(message: '$error'),
            ),
            const SizedBox(height: 16),
            calibration.when(
              data: (state) => _CalibrationCard(days: state.days, accuracy: state.accuracy),
              loading: () => const _LoadingCard(height: 88),
              error: (error, stack) => _ErrorCard(message: '$error'),
            ),
            const SectionHeader('Activity Summary'),
            metrics.when(
              data: (items) => _ActivityGrid(today: items.isEmpty ? null : items.first),
              loading: () => const _LoadingCard(height: 160),
              error: (error, stack) => _ErrorCard(message: '$error'),
            ),
            const SectionHeader('Trends'),
            metrics.when(
              data: (items) => _Charts(metrics: items),
              loading: () => const _LoadingCard(height: 260),
              error: (error, stack) => _ErrorCard(message: '$error'),
            ),
            const SectionHeader('Recommendations'),
            for (final item in recommendations)
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.tips_and_updates),
                  title: Text(item),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _WellnessHero extends StatelessWidget {
  const _WellnessHero({required this.prediction});

  final RiskPrediction? prediction;

  @override
  Widget build(BuildContext context) {
    final score = prediction?.wellnessScore.round() ?? 0;
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: score / 100,
                    strokeWidth: 12,
                    color: score >= 70 ? scheme.primary : scheme.error,
                    backgroundColor: scheme.surfaceContainerHighest,
                    strokeCap: StrokeCap.round,
                  ),
                  Center(
                    child: FittedBox(
                      child: Text('$score', style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wellness Score', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Text('Stress Risk: ${(prediction?.stressScore ?? 0).round()}%'),
                  Text('Sleep Risk: ${(prediction?.sleepScore ?? 0).round()}%'),
                  Text('Confidence: ${(((prediction?.confidence ?? 0) * 100).round())}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CalibrationCard extends StatelessWidget {
  const _CalibrationCard({required this.days, required this.accuracy});

  final int days;
  final double accuracy;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day $days of 14', style: Theme.of(context).textTheme.titleMedium),
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

class _ActivityGrid extends StatelessWidget {
  const _ActivityGrid({required this.today});

  final DailyMetric? today;

  @override
  Widget build(BuildContext context) {
    final item = today;
    return GridView.count(
      crossAxisCount: MediaQuery.sizeOf(context).width > 700 ? 4 : 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.25,
      children: [
        MetricCard(title: 'Steps', value: '${item?.steps ?? 0}', icon: Icons.directions_walk),
        MetricCard(title: 'Walking', value: '${item?.walkingMinutes ?? 0} min', icon: Icons.timer),
        MetricCard(title: 'Sedentary', value: '${item?.sedentaryMinutes ?? 0} min', icon: Icons.chair),
        MetricCard(title: 'Screen Time', value: '${item?.screenTimeMinutes ?? 0} min', icon: Icons.phone_android),
      ],
    );
  }
}

class _Charts extends StatelessWidget {
  const _Charts({required this.metrics});

  final List<DailyMetric> metrics;

  @override
  Widget build(BuildContext context) {
    final ordered = metrics.reversed.toList();
    return Column(
      children: [
        _TrendCard(title: 'Weekly Activity Chart', spots: _spots(ordered.map((m) => m.steps / 1000))),
        const SizedBox(height: 12),
        _TrendCard(title: 'Screen Usage Trend', spots: _spots(ordered.map((m) => m.screenTimeMinutes / 60))),
        const SizedBox(height: 12),
        _TrendCard(title: 'Wellness Trend', spots: _spots(ordered.map((m) => (m.steps / 120).clamp(0, 100)))),
      ],
    );
  }

  List<FlSpot> _spots(Iterable<num> values) {
    final list = values.toList();
    if (list.isEmpty) return const [FlSpot(0, 0)];
    return [
      for (var i = 0; i < list.length; i++) FlSpot(i.toDouble(), list[i].toDouble()),
    ];
  }
}

class _TrendCard extends StatelessWidget {
  const _TrendCard({required this.title, required this.spots});

  final String title;
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 14),
            SizedBox(
              height: 160,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      barWidth: 4,
                      dotData: const FlDotData(show: false),
                      color: scheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: height,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
