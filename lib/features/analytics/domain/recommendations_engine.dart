import '../../../core/data/local/app_database.dart';

class RecommendationsEngine {
  List<String> generate({
    required DailyMetric? today,
    required List<DailyMetric> history,
    required RiskPrediction? prediction,
  }) {
    if (today == null) {
      return ['Begin calibration to unlock personalized wellness recommendations.'];
    }
    final previous = history.skip(1).take(7).toList();
    final avgNight = _average(previous.map((m) => m.nightUsageMinutes));
    final avgSteps = _average(previous.map((m) => m.steps));
    final items = <String>[];

    if (avgNight > 0 && today.nightUsageMinutes > avgNight * 1.3) {
      final pct = (((today.nightUsageMinutes - avgNight) / avgNight) * 100).round();
      items.add('Your nighttime phone usage increased $pct%. Consider reducing screen exposure before bedtime.');
    }
    if (avgSteps > 0 && today.steps < avgSteps * 0.75) {
      items.add('Your activity level dropped significantly this week. A 20 minute walk may help improve wellness.');
    }
    if ((prediction?.stressScore ?? 0) >= 70) {
      items.add('High stress risk is trending today. A short breathing break may help lower device interaction spikes.');
    }
    if (items.isEmpty) {
      items.add('Your current pattern is close to baseline. Keep your routine steady today.');
    }
    return items;
  }

  double _average(Iterable<num> values) {
    final list = values.toList();
    if (list.isEmpty) return 0;
    return list.reduce((a, b) => a + b) / list.length;
  }
}
