import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class DailyMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().unique()();
  IntColumn get steps => integer().withDefault(const Constant(0))();
  IntColumn get screenTimeMinutes => integer().withDefault(const Constant(0))();
  IntColumn get unlockCount => integer().withDefault(const Constant(0))();
  IntColumn get walkingMinutes => integer().withDefault(const Constant(0))();
  IntColumn get sedentaryMinutes => integer().withDefault(const Constant(0))();
  IntColumn get nightUsageMinutes => integer().withDefault(const Constant(0))();
  IntColumn get appOpenFrequency => integer().withDefault(const Constant(0))();
  IntColumn get deviceInteractionFrequency => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class RiskPredictions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().unique()();
  RealColumn get stressScore => real()();
  RealColumn get sleepScore => real()();
  RealColumn get wellnessScore => real()();
  RealColumn get confidence => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class BaselineMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get metricName => text().unique()();
  RealColumn get mean => real()();
  RealColumn get standardDeviation => real()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DriftDatabase(tables: [DailyMetrics, RiskPredictions, BaselineMetrics])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  AppDatabase.defaults()
      : super(
          driftDatabase(
            name: 'auravitals',
            native: const DriftNativeOptions(shareAcrossIsolates: true),
          ),
        );

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(dailyMetrics, dailyMetrics.appOpenFrequency);
            await m.addColumn(
              dailyMetrics,
              dailyMetrics.deviceInteractionFrequency,
            );
          }
        },
      );

  Future<int> upsertDailyMetric(DailyMetricsCompanion entry) {
    return into(dailyMetrics).insertOnConflictUpdate(entry);
  }

  Future<int> upsertPrediction(RiskPredictionsCompanion entry) {
    return into(riskPredictions).insertOnConflictUpdate(entry);
  }

  Future<int> upsertBaseline(BaselineMetricsCompanion entry) {
    return into(baselineMetrics).insertOnConflictUpdate(entry);
  }

  Future<DailyMetric?> metricForDate(DateTime date) {
    final day = normalizedDate(date);
    return (select(dailyMetrics)..where((row) => row.date.equals(day)))
        .getSingleOrNull();
  }

  Future<RiskPrediction?> predictionForDate(DateTime date) {
    final day = normalizedDate(date);
    return (select(riskPredictions)..where((row) => row.date.equals(day)))
        .getSingleOrNull();
  }

  Stream<List<DailyMetric>> watchLatestMetrics(int limit) {
    return (select(dailyMetrics)
          ..orderBy([(row) => OrderingTerm.desc(row.date)])
          ..limit(limit))
        .watch();
  }

  Future<List<DailyMetric>> latestMetrics(int limit) {
    return (select(dailyMetrics)
          ..orderBy([(row) => OrderingTerm.desc(row.date)])
          ..limit(limit))
        .get();
  }

  Stream<List<RiskPrediction>> watchLatestPredictions(int limit) {
    return (select(riskPredictions)
          ..orderBy([(row) => OrderingTerm.desc(row.date)])
          ..limit(limit))
        .watch();
  }

  Future<List<BaselineMetric>> allBaselines() {
    return select(baselineMetrics).get();
  }

  Future<void> clearHealthData() async {
    await transaction(() async {
      await delete(riskPredictions).go();
      await delete(dailyMetrics).go();
      await delete(baselineMetrics).go();
    });
  }

  Future<void> clearBaselines() async => delete(baselineMetrics).go();
}

DateTime normalizedDate(DateTime date) => DateTime(date.year, date.month, date.day);
