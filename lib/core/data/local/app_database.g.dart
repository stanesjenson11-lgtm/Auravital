// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DailyMetricsTable extends DailyMetrics
    with TableInfo<$DailyMetricsTable, DailyMetric> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyMetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _screenTimeMinutesMeta = const VerificationMeta(
    'screenTimeMinutes',
  );
  @override
  late final GeneratedColumn<int> screenTimeMinutes = GeneratedColumn<int>(
    'screen_time_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _unlockCountMeta = const VerificationMeta(
    'unlockCount',
  );
  @override
  late final GeneratedColumn<int> unlockCount = GeneratedColumn<int>(
    'unlock_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _walkingMinutesMeta = const VerificationMeta(
    'walkingMinutes',
  );
  @override
  late final GeneratedColumn<int> walkingMinutes = GeneratedColumn<int>(
    'walking_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sedentaryMinutesMeta = const VerificationMeta(
    'sedentaryMinutes',
  );
  @override
  late final GeneratedColumn<int> sedentaryMinutes = GeneratedColumn<int>(
    'sedentary_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nightUsageMinutesMeta = const VerificationMeta(
    'nightUsageMinutes',
  );
  @override
  late final GeneratedColumn<int> nightUsageMinutes = GeneratedColumn<int>(
    'night_usage_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _appOpenFrequencyMeta = const VerificationMeta(
    'appOpenFrequency',
  );
  @override
  late final GeneratedColumn<int> appOpenFrequency = GeneratedColumn<int>(
    'app_open_frequency',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deviceInteractionFrequencyMeta =
      const VerificationMeta('deviceInteractionFrequency');
  @override
  late final GeneratedColumn<int> deviceInteractionFrequency =
      GeneratedColumn<int>(
        'device_interaction_frequency',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    steps,
    screenTimeMinutes,
    unlockCount,
    walkingMinutes,
    sedentaryMinutes,
    nightUsageMinutes,
    appOpenFrequency,
    deviceInteractionFrequency,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_metrics';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyMetric> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    if (data.containsKey('screen_time_minutes')) {
      context.handle(
        _screenTimeMinutesMeta,
        screenTimeMinutes.isAcceptableOrUnknown(
          data['screen_time_minutes']!,
          _screenTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('unlock_count')) {
      context.handle(
        _unlockCountMeta,
        unlockCount.isAcceptableOrUnknown(
          data['unlock_count']!,
          _unlockCountMeta,
        ),
      );
    }
    if (data.containsKey('walking_minutes')) {
      context.handle(
        _walkingMinutesMeta,
        walkingMinutes.isAcceptableOrUnknown(
          data['walking_minutes']!,
          _walkingMinutesMeta,
        ),
      );
    }
    if (data.containsKey('sedentary_minutes')) {
      context.handle(
        _sedentaryMinutesMeta,
        sedentaryMinutes.isAcceptableOrUnknown(
          data['sedentary_minutes']!,
          _sedentaryMinutesMeta,
        ),
      );
    }
    if (data.containsKey('night_usage_minutes')) {
      context.handle(
        _nightUsageMinutesMeta,
        nightUsageMinutes.isAcceptableOrUnknown(
          data['night_usage_minutes']!,
          _nightUsageMinutesMeta,
        ),
      );
    }
    if (data.containsKey('app_open_frequency')) {
      context.handle(
        _appOpenFrequencyMeta,
        appOpenFrequency.isAcceptableOrUnknown(
          data['app_open_frequency']!,
          _appOpenFrequencyMeta,
        ),
      );
    }
    if (data.containsKey('device_interaction_frequency')) {
      context.handle(
        _deviceInteractionFrequencyMeta,
        deviceInteractionFrequency.isAcceptableOrUnknown(
          data['device_interaction_frequency']!,
          _deviceInteractionFrequencyMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyMetric map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyMetric(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      )!,
      screenTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}screen_time_minutes'],
      )!,
      unlockCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unlock_count'],
      )!,
      walkingMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}walking_minutes'],
      )!,
      sedentaryMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sedentary_minutes'],
      )!,
      nightUsageMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}night_usage_minutes'],
      )!,
      appOpenFrequency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}app_open_frequency'],
      )!,
      deviceInteractionFrequency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}device_interaction_frequency'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DailyMetricsTable createAlias(String alias) {
    return $DailyMetricsTable(attachedDatabase, alias);
  }
}

class DailyMetric extends DataClass implements Insertable<DailyMetric> {
  final int id;
  final DateTime date;
  final int steps;
  final int screenTimeMinutes;
  final int unlockCount;
  final int walkingMinutes;
  final int sedentaryMinutes;
  final int nightUsageMinutes;
  final int appOpenFrequency;
  final int deviceInteractionFrequency;
  final DateTime updatedAt;
  const DailyMetric({
    required this.id,
    required this.date,
    required this.steps,
    required this.screenTimeMinutes,
    required this.unlockCount,
    required this.walkingMinutes,
    required this.sedentaryMinutes,
    required this.nightUsageMinutes,
    required this.appOpenFrequency,
    required this.deviceInteractionFrequency,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['steps'] = Variable<int>(steps);
    map['screen_time_minutes'] = Variable<int>(screenTimeMinutes);
    map['unlock_count'] = Variable<int>(unlockCount);
    map['walking_minutes'] = Variable<int>(walkingMinutes);
    map['sedentary_minutes'] = Variable<int>(sedentaryMinutes);
    map['night_usage_minutes'] = Variable<int>(nightUsageMinutes);
    map['app_open_frequency'] = Variable<int>(appOpenFrequency);
    map['device_interaction_frequency'] = Variable<int>(
      deviceInteractionFrequency,
    );
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DailyMetricsCompanion toCompanion(bool nullToAbsent) {
    return DailyMetricsCompanion(
      id: Value(id),
      date: Value(date),
      steps: Value(steps),
      screenTimeMinutes: Value(screenTimeMinutes),
      unlockCount: Value(unlockCount),
      walkingMinutes: Value(walkingMinutes),
      sedentaryMinutes: Value(sedentaryMinutes),
      nightUsageMinutes: Value(nightUsageMinutes),
      appOpenFrequency: Value(appOpenFrequency),
      deviceInteractionFrequency: Value(deviceInteractionFrequency),
      updatedAt: Value(updatedAt),
    );
  }

  factory DailyMetric.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyMetric(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      steps: serializer.fromJson<int>(json['steps']),
      screenTimeMinutes: serializer.fromJson<int>(json['screenTimeMinutes']),
      unlockCount: serializer.fromJson<int>(json['unlockCount']),
      walkingMinutes: serializer.fromJson<int>(json['walkingMinutes']),
      sedentaryMinutes: serializer.fromJson<int>(json['sedentaryMinutes']),
      nightUsageMinutes: serializer.fromJson<int>(json['nightUsageMinutes']),
      appOpenFrequency: serializer.fromJson<int>(json['appOpenFrequency']),
      deviceInteractionFrequency: serializer.fromJson<int>(
        json['deviceInteractionFrequency'],
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'steps': serializer.toJson<int>(steps),
      'screenTimeMinutes': serializer.toJson<int>(screenTimeMinutes),
      'unlockCount': serializer.toJson<int>(unlockCount),
      'walkingMinutes': serializer.toJson<int>(walkingMinutes),
      'sedentaryMinutes': serializer.toJson<int>(sedentaryMinutes),
      'nightUsageMinutes': serializer.toJson<int>(nightUsageMinutes),
      'appOpenFrequency': serializer.toJson<int>(appOpenFrequency),
      'deviceInteractionFrequency': serializer.toJson<int>(
        deviceInteractionFrequency,
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DailyMetric copyWith({
    int? id,
    DateTime? date,
    int? steps,
    int? screenTimeMinutes,
    int? unlockCount,
    int? walkingMinutes,
    int? sedentaryMinutes,
    int? nightUsageMinutes,
    int? appOpenFrequency,
    int? deviceInteractionFrequency,
    DateTime? updatedAt,
  }) => DailyMetric(
    id: id ?? this.id,
    date: date ?? this.date,
    steps: steps ?? this.steps,
    screenTimeMinutes: screenTimeMinutes ?? this.screenTimeMinutes,
    unlockCount: unlockCount ?? this.unlockCount,
    walkingMinutes: walkingMinutes ?? this.walkingMinutes,
    sedentaryMinutes: sedentaryMinutes ?? this.sedentaryMinutes,
    nightUsageMinutes: nightUsageMinutes ?? this.nightUsageMinutes,
    appOpenFrequency: appOpenFrequency ?? this.appOpenFrequency,
    deviceInteractionFrequency:
        deviceInteractionFrequency ?? this.deviceInteractionFrequency,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DailyMetric copyWithCompanion(DailyMetricsCompanion data) {
    return DailyMetric(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      steps: data.steps.present ? data.steps.value : this.steps,
      screenTimeMinutes: data.screenTimeMinutes.present
          ? data.screenTimeMinutes.value
          : this.screenTimeMinutes,
      unlockCount: data.unlockCount.present
          ? data.unlockCount.value
          : this.unlockCount,
      walkingMinutes: data.walkingMinutes.present
          ? data.walkingMinutes.value
          : this.walkingMinutes,
      sedentaryMinutes: data.sedentaryMinutes.present
          ? data.sedentaryMinutes.value
          : this.sedentaryMinutes,
      nightUsageMinutes: data.nightUsageMinutes.present
          ? data.nightUsageMinutes.value
          : this.nightUsageMinutes,
      appOpenFrequency: data.appOpenFrequency.present
          ? data.appOpenFrequency.value
          : this.appOpenFrequency,
      deviceInteractionFrequency: data.deviceInteractionFrequency.present
          ? data.deviceInteractionFrequency.value
          : this.deviceInteractionFrequency,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyMetric(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('steps: $steps, ')
          ..write('screenTimeMinutes: $screenTimeMinutes, ')
          ..write('unlockCount: $unlockCount, ')
          ..write('walkingMinutes: $walkingMinutes, ')
          ..write('sedentaryMinutes: $sedentaryMinutes, ')
          ..write('nightUsageMinutes: $nightUsageMinutes, ')
          ..write('appOpenFrequency: $appOpenFrequency, ')
          ..write('deviceInteractionFrequency: $deviceInteractionFrequency, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    steps,
    screenTimeMinutes,
    unlockCount,
    walkingMinutes,
    sedentaryMinutes,
    nightUsageMinutes,
    appOpenFrequency,
    deviceInteractionFrequency,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyMetric &&
          other.id == this.id &&
          other.date == this.date &&
          other.steps == this.steps &&
          other.screenTimeMinutes == this.screenTimeMinutes &&
          other.unlockCount == this.unlockCount &&
          other.walkingMinutes == this.walkingMinutes &&
          other.sedentaryMinutes == this.sedentaryMinutes &&
          other.nightUsageMinutes == this.nightUsageMinutes &&
          other.appOpenFrequency == this.appOpenFrequency &&
          other.deviceInteractionFrequency == this.deviceInteractionFrequency &&
          other.updatedAt == this.updatedAt);
}

class DailyMetricsCompanion extends UpdateCompanion<DailyMetric> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> steps;
  final Value<int> screenTimeMinutes;
  final Value<int> unlockCount;
  final Value<int> walkingMinutes;
  final Value<int> sedentaryMinutes;
  final Value<int> nightUsageMinutes;
  final Value<int> appOpenFrequency;
  final Value<int> deviceInteractionFrequency;
  final Value<DateTime> updatedAt;
  const DailyMetricsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.steps = const Value.absent(),
    this.screenTimeMinutes = const Value.absent(),
    this.unlockCount = const Value.absent(),
    this.walkingMinutes = const Value.absent(),
    this.sedentaryMinutes = const Value.absent(),
    this.nightUsageMinutes = const Value.absent(),
    this.appOpenFrequency = const Value.absent(),
    this.deviceInteractionFrequency = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DailyMetricsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.steps = const Value.absent(),
    this.screenTimeMinutes = const Value.absent(),
    this.unlockCount = const Value.absent(),
    this.walkingMinutes = const Value.absent(),
    this.sedentaryMinutes = const Value.absent(),
    this.nightUsageMinutes = const Value.absent(),
    this.appOpenFrequency = const Value.absent(),
    this.deviceInteractionFrequency = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : date = Value(date);
  static Insertable<DailyMetric> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? steps,
    Expression<int>? screenTimeMinutes,
    Expression<int>? unlockCount,
    Expression<int>? walkingMinutes,
    Expression<int>? sedentaryMinutes,
    Expression<int>? nightUsageMinutes,
    Expression<int>? appOpenFrequency,
    Expression<int>? deviceInteractionFrequency,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (steps != null) 'steps': steps,
      if (screenTimeMinutes != null) 'screen_time_minutes': screenTimeMinutes,
      if (unlockCount != null) 'unlock_count': unlockCount,
      if (walkingMinutes != null) 'walking_minutes': walkingMinutes,
      if (sedentaryMinutes != null) 'sedentary_minutes': sedentaryMinutes,
      if (nightUsageMinutes != null) 'night_usage_minutes': nightUsageMinutes,
      if (appOpenFrequency != null) 'app_open_frequency': appOpenFrequency,
      if (deviceInteractionFrequency != null)
        'device_interaction_frequency': deviceInteractionFrequency,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DailyMetricsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? steps,
    Value<int>? screenTimeMinutes,
    Value<int>? unlockCount,
    Value<int>? walkingMinutes,
    Value<int>? sedentaryMinutes,
    Value<int>? nightUsageMinutes,
    Value<int>? appOpenFrequency,
    Value<int>? deviceInteractionFrequency,
    Value<DateTime>? updatedAt,
  }) {
    return DailyMetricsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      steps: steps ?? this.steps,
      screenTimeMinutes: screenTimeMinutes ?? this.screenTimeMinutes,
      unlockCount: unlockCount ?? this.unlockCount,
      walkingMinutes: walkingMinutes ?? this.walkingMinutes,
      sedentaryMinutes: sedentaryMinutes ?? this.sedentaryMinutes,
      nightUsageMinutes: nightUsageMinutes ?? this.nightUsageMinutes,
      appOpenFrequency: appOpenFrequency ?? this.appOpenFrequency,
      deviceInteractionFrequency:
          deviceInteractionFrequency ?? this.deviceInteractionFrequency,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (screenTimeMinutes.present) {
      map['screen_time_minutes'] = Variable<int>(screenTimeMinutes.value);
    }
    if (unlockCount.present) {
      map['unlock_count'] = Variable<int>(unlockCount.value);
    }
    if (walkingMinutes.present) {
      map['walking_minutes'] = Variable<int>(walkingMinutes.value);
    }
    if (sedentaryMinutes.present) {
      map['sedentary_minutes'] = Variable<int>(sedentaryMinutes.value);
    }
    if (nightUsageMinutes.present) {
      map['night_usage_minutes'] = Variable<int>(nightUsageMinutes.value);
    }
    if (appOpenFrequency.present) {
      map['app_open_frequency'] = Variable<int>(appOpenFrequency.value);
    }
    if (deviceInteractionFrequency.present) {
      map['device_interaction_frequency'] = Variable<int>(
        deviceInteractionFrequency.value,
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyMetricsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('steps: $steps, ')
          ..write('screenTimeMinutes: $screenTimeMinutes, ')
          ..write('unlockCount: $unlockCount, ')
          ..write('walkingMinutes: $walkingMinutes, ')
          ..write('sedentaryMinutes: $sedentaryMinutes, ')
          ..write('nightUsageMinutes: $nightUsageMinutes, ')
          ..write('appOpenFrequency: $appOpenFrequency, ')
          ..write('deviceInteractionFrequency: $deviceInteractionFrequency, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RiskPredictionsTable extends RiskPredictions
    with TableInfo<$RiskPredictionsTable, RiskPrediction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RiskPredictionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _stressScoreMeta = const VerificationMeta(
    'stressScore',
  );
  @override
  late final GeneratedColumn<double> stressScore = GeneratedColumn<double>(
    'stress_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sleepScoreMeta = const VerificationMeta(
    'sleepScore',
  );
  @override
  late final GeneratedColumn<double> sleepScore = GeneratedColumn<double>(
    'sleep_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wellnessScoreMeta = const VerificationMeta(
    'wellnessScore',
  );
  @override
  late final GeneratedColumn<double> wellnessScore = GeneratedColumn<double>(
    'wellness_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    stressScore,
    sleepScore,
    wellnessScore,
    confidence,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'risk_predictions';
  @override
  VerificationContext validateIntegrity(
    Insertable<RiskPrediction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('stress_score')) {
      context.handle(
        _stressScoreMeta,
        stressScore.isAcceptableOrUnknown(
          data['stress_score']!,
          _stressScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stressScoreMeta);
    }
    if (data.containsKey('sleep_score')) {
      context.handle(
        _sleepScoreMeta,
        sleepScore.isAcceptableOrUnknown(data['sleep_score']!, _sleepScoreMeta),
      );
    } else if (isInserting) {
      context.missing(_sleepScoreMeta);
    }
    if (data.containsKey('wellness_score')) {
      context.handle(
        _wellnessScoreMeta,
        wellnessScore.isAcceptableOrUnknown(
          data['wellness_score']!,
          _wellnessScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_wellnessScoreMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RiskPrediction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RiskPrediction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      stressScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}stress_score'],
      )!,
      sleepScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sleep_score'],
      )!,
      wellnessScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wellness_score'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RiskPredictionsTable createAlias(String alias) {
    return $RiskPredictionsTable(attachedDatabase, alias);
  }
}

class RiskPrediction extends DataClass implements Insertable<RiskPrediction> {
  final int id;
  final DateTime date;
  final double stressScore;
  final double sleepScore;
  final double wellnessScore;
  final double confidence;
  final DateTime createdAt;
  const RiskPrediction({
    required this.id,
    required this.date,
    required this.stressScore,
    required this.sleepScore,
    required this.wellnessScore,
    required this.confidence,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['stress_score'] = Variable<double>(stressScore);
    map['sleep_score'] = Variable<double>(sleepScore);
    map['wellness_score'] = Variable<double>(wellnessScore);
    map['confidence'] = Variable<double>(confidence);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RiskPredictionsCompanion toCompanion(bool nullToAbsent) {
    return RiskPredictionsCompanion(
      id: Value(id),
      date: Value(date),
      stressScore: Value(stressScore),
      sleepScore: Value(sleepScore),
      wellnessScore: Value(wellnessScore),
      confidence: Value(confidence),
      createdAt: Value(createdAt),
    );
  }

  factory RiskPrediction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RiskPrediction(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      stressScore: serializer.fromJson<double>(json['stressScore']),
      sleepScore: serializer.fromJson<double>(json['sleepScore']),
      wellnessScore: serializer.fromJson<double>(json['wellnessScore']),
      confidence: serializer.fromJson<double>(json['confidence']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'stressScore': serializer.toJson<double>(stressScore),
      'sleepScore': serializer.toJson<double>(sleepScore),
      'wellnessScore': serializer.toJson<double>(wellnessScore),
      'confidence': serializer.toJson<double>(confidence),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RiskPrediction copyWith({
    int? id,
    DateTime? date,
    double? stressScore,
    double? sleepScore,
    double? wellnessScore,
    double? confidence,
    DateTime? createdAt,
  }) => RiskPrediction(
    id: id ?? this.id,
    date: date ?? this.date,
    stressScore: stressScore ?? this.stressScore,
    sleepScore: sleepScore ?? this.sleepScore,
    wellnessScore: wellnessScore ?? this.wellnessScore,
    confidence: confidence ?? this.confidence,
    createdAt: createdAt ?? this.createdAt,
  );
  RiskPrediction copyWithCompanion(RiskPredictionsCompanion data) {
    return RiskPrediction(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      stressScore: data.stressScore.present
          ? data.stressScore.value
          : this.stressScore,
      sleepScore: data.sleepScore.present
          ? data.sleepScore.value
          : this.sleepScore,
      wellnessScore: data.wellnessScore.present
          ? data.wellnessScore.value
          : this.wellnessScore,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RiskPrediction(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('stressScore: $stressScore, ')
          ..write('sleepScore: $sleepScore, ')
          ..write('wellnessScore: $wellnessScore, ')
          ..write('confidence: $confidence, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    stressScore,
    sleepScore,
    wellnessScore,
    confidence,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RiskPrediction &&
          other.id == this.id &&
          other.date == this.date &&
          other.stressScore == this.stressScore &&
          other.sleepScore == this.sleepScore &&
          other.wellnessScore == this.wellnessScore &&
          other.confidence == this.confidence &&
          other.createdAt == this.createdAt);
}

class RiskPredictionsCompanion extends UpdateCompanion<RiskPrediction> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> stressScore;
  final Value<double> sleepScore;
  final Value<double> wellnessScore;
  final Value<double> confidence;
  final Value<DateTime> createdAt;
  const RiskPredictionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.stressScore = const Value.absent(),
    this.sleepScore = const Value.absent(),
    this.wellnessScore = const Value.absent(),
    this.confidence = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RiskPredictionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double stressScore,
    required double sleepScore,
    required double wellnessScore,
    required double confidence,
    this.createdAt = const Value.absent(),
  }) : date = Value(date),
       stressScore = Value(stressScore),
       sleepScore = Value(sleepScore),
       wellnessScore = Value(wellnessScore),
       confidence = Value(confidence);
  static Insertable<RiskPrediction> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? stressScore,
    Expression<double>? sleepScore,
    Expression<double>? wellnessScore,
    Expression<double>? confidence,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (stressScore != null) 'stress_score': stressScore,
      if (sleepScore != null) 'sleep_score': sleepScore,
      if (wellnessScore != null) 'wellness_score': wellnessScore,
      if (confidence != null) 'confidence': confidence,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RiskPredictionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double>? stressScore,
    Value<double>? sleepScore,
    Value<double>? wellnessScore,
    Value<double>? confidence,
    Value<DateTime>? createdAt,
  }) {
    return RiskPredictionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      stressScore: stressScore ?? this.stressScore,
      sleepScore: sleepScore ?? this.sleepScore,
      wellnessScore: wellnessScore ?? this.wellnessScore,
      confidence: confidence ?? this.confidence,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (stressScore.present) {
      map['stress_score'] = Variable<double>(stressScore.value);
    }
    if (sleepScore.present) {
      map['sleep_score'] = Variable<double>(sleepScore.value);
    }
    if (wellnessScore.present) {
      map['wellness_score'] = Variable<double>(wellnessScore.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RiskPredictionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('stressScore: $stressScore, ')
          ..write('sleepScore: $sleepScore, ')
          ..write('wellnessScore: $wellnessScore, ')
          ..write('confidence: $confidence, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BaselineMetricsTable extends BaselineMetrics
    with TableInfo<$BaselineMetricsTable, BaselineMetric> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BaselineMetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _metricNameMeta = const VerificationMeta(
    'metricName',
  );
  @override
  late final GeneratedColumn<String> metricName = GeneratedColumn<String>(
    'metric_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _meanMeta = const VerificationMeta('mean');
  @override
  late final GeneratedColumn<double> mean = GeneratedColumn<double>(
    'mean',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _standardDeviationMeta = const VerificationMeta(
    'standardDeviation',
  );
  @override
  late final GeneratedColumn<double> standardDeviation =
      GeneratedColumn<double>(
        'standard_deviation',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    metricName,
    mean,
    standardDeviation,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baseline_metrics';
  @override
  VerificationContext validateIntegrity(
    Insertable<BaselineMetric> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('metric_name')) {
      context.handle(
        _metricNameMeta,
        metricName.isAcceptableOrUnknown(data['metric_name']!, _metricNameMeta),
      );
    } else if (isInserting) {
      context.missing(_metricNameMeta);
    }
    if (data.containsKey('mean')) {
      context.handle(
        _meanMeta,
        mean.isAcceptableOrUnknown(data['mean']!, _meanMeta),
      );
    } else if (isInserting) {
      context.missing(_meanMeta);
    }
    if (data.containsKey('standard_deviation')) {
      context.handle(
        _standardDeviationMeta,
        standardDeviation.isAcceptableOrUnknown(
          data['standard_deviation']!,
          _standardDeviationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_standardDeviationMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BaselineMetric map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BaselineMetric(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      metricName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metric_name'],
      )!,
      mean: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mean'],
      )!,
      standardDeviation: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}standard_deviation'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BaselineMetricsTable createAlias(String alias) {
    return $BaselineMetricsTable(attachedDatabase, alias);
  }
}

class BaselineMetric extends DataClass implements Insertable<BaselineMetric> {
  final int id;
  final String metricName;
  final double mean;
  final double standardDeviation;
  final DateTime updatedAt;
  const BaselineMetric({
    required this.id,
    required this.metricName,
    required this.mean,
    required this.standardDeviation,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['metric_name'] = Variable<String>(metricName);
    map['mean'] = Variable<double>(mean);
    map['standard_deviation'] = Variable<double>(standardDeviation);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BaselineMetricsCompanion toCompanion(bool nullToAbsent) {
    return BaselineMetricsCompanion(
      id: Value(id),
      metricName: Value(metricName),
      mean: Value(mean),
      standardDeviation: Value(standardDeviation),
      updatedAt: Value(updatedAt),
    );
  }

  factory BaselineMetric.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BaselineMetric(
      id: serializer.fromJson<int>(json['id']),
      metricName: serializer.fromJson<String>(json['metricName']),
      mean: serializer.fromJson<double>(json['mean']),
      standardDeviation: serializer.fromJson<double>(json['standardDeviation']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'metricName': serializer.toJson<String>(metricName),
      'mean': serializer.toJson<double>(mean),
      'standardDeviation': serializer.toJson<double>(standardDeviation),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BaselineMetric copyWith({
    int? id,
    String? metricName,
    double? mean,
    double? standardDeviation,
    DateTime? updatedAt,
  }) => BaselineMetric(
    id: id ?? this.id,
    metricName: metricName ?? this.metricName,
    mean: mean ?? this.mean,
    standardDeviation: standardDeviation ?? this.standardDeviation,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BaselineMetric copyWithCompanion(BaselineMetricsCompanion data) {
    return BaselineMetric(
      id: data.id.present ? data.id.value : this.id,
      metricName: data.metricName.present
          ? data.metricName.value
          : this.metricName,
      mean: data.mean.present ? data.mean.value : this.mean,
      standardDeviation: data.standardDeviation.present
          ? data.standardDeviation.value
          : this.standardDeviation,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BaselineMetric(')
          ..write('id: $id, ')
          ..write('metricName: $metricName, ')
          ..write('mean: $mean, ')
          ..write('standardDeviation: $standardDeviation, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, metricName, mean, standardDeviation, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaselineMetric &&
          other.id == this.id &&
          other.metricName == this.metricName &&
          other.mean == this.mean &&
          other.standardDeviation == this.standardDeviation &&
          other.updatedAt == this.updatedAt);
}

class BaselineMetricsCompanion extends UpdateCompanion<BaselineMetric> {
  final Value<int> id;
  final Value<String> metricName;
  final Value<double> mean;
  final Value<double> standardDeviation;
  final Value<DateTime> updatedAt;
  const BaselineMetricsCompanion({
    this.id = const Value.absent(),
    this.metricName = const Value.absent(),
    this.mean = const Value.absent(),
    this.standardDeviation = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BaselineMetricsCompanion.insert({
    this.id = const Value.absent(),
    required String metricName,
    required double mean,
    required double standardDeviation,
    required DateTime updatedAt,
  }) : metricName = Value(metricName),
       mean = Value(mean),
       standardDeviation = Value(standardDeviation),
       updatedAt = Value(updatedAt);
  static Insertable<BaselineMetric> custom({
    Expression<int>? id,
    Expression<String>? metricName,
    Expression<double>? mean,
    Expression<double>? standardDeviation,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (metricName != null) 'metric_name': metricName,
      if (mean != null) 'mean': mean,
      if (standardDeviation != null) 'standard_deviation': standardDeviation,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BaselineMetricsCompanion copyWith({
    Value<int>? id,
    Value<String>? metricName,
    Value<double>? mean,
    Value<double>? standardDeviation,
    Value<DateTime>? updatedAt,
  }) {
    return BaselineMetricsCompanion(
      id: id ?? this.id,
      metricName: metricName ?? this.metricName,
      mean: mean ?? this.mean,
      standardDeviation: standardDeviation ?? this.standardDeviation,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (metricName.present) {
      map['metric_name'] = Variable<String>(metricName.value);
    }
    if (mean.present) {
      map['mean'] = Variable<double>(mean.value);
    }
    if (standardDeviation.present) {
      map['standard_deviation'] = Variable<double>(standardDeviation.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaselineMetricsCompanion(')
          ..write('id: $id, ')
          ..write('metricName: $metricName, ')
          ..write('mean: $mean, ')
          ..write('standardDeviation: $standardDeviation, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DailyMetricsTable dailyMetrics = $DailyMetricsTable(this);
  late final $RiskPredictionsTable riskPredictions = $RiskPredictionsTable(
    this,
  );
  late final $BaselineMetricsTable baselineMetrics = $BaselineMetricsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dailyMetrics,
    riskPredictions,
    baselineMetrics,
  ];
}

typedef $$DailyMetricsTableCreateCompanionBuilder =
    DailyMetricsCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<int> steps,
      Value<int> screenTimeMinutes,
      Value<int> unlockCount,
      Value<int> walkingMinutes,
      Value<int> sedentaryMinutes,
      Value<int> nightUsageMinutes,
      Value<int> appOpenFrequency,
      Value<int> deviceInteractionFrequency,
      Value<DateTime> updatedAt,
    });
typedef $$DailyMetricsTableUpdateCompanionBuilder =
    DailyMetricsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> steps,
      Value<int> screenTimeMinutes,
      Value<int> unlockCount,
      Value<int> walkingMinutes,
      Value<int> sedentaryMinutes,
      Value<int> nightUsageMinutes,
      Value<int> appOpenFrequency,
      Value<int> deviceInteractionFrequency,
      Value<DateTime> updatedAt,
    });

class $$DailyMetricsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyMetricsTable> {
  $$DailyMetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get screenTimeMinutes => $composableBuilder(
    column: $table.screenTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unlockCount => $composableBuilder(
    column: $table.unlockCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get walkingMinutes => $composableBuilder(
    column: $table.walkingMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sedentaryMinutes => $composableBuilder(
    column: $table.sedentaryMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nightUsageMinutes => $composableBuilder(
    column: $table.nightUsageMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get appOpenFrequency => $composableBuilder(
    column: $table.appOpenFrequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deviceInteractionFrequency => $composableBuilder(
    column: $table.deviceInteractionFrequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyMetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyMetricsTable> {
  $$DailyMetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get screenTimeMinutes => $composableBuilder(
    column: $table.screenTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unlockCount => $composableBuilder(
    column: $table.unlockCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get walkingMinutes => $composableBuilder(
    column: $table.walkingMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sedentaryMinutes => $composableBuilder(
    column: $table.sedentaryMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nightUsageMinutes => $composableBuilder(
    column: $table.nightUsageMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get appOpenFrequency => $composableBuilder(
    column: $table.appOpenFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deviceInteractionFrequency => $composableBuilder(
    column: $table.deviceInteractionFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyMetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyMetricsTable> {
  $$DailyMetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<int> get screenTimeMinutes => $composableBuilder(
    column: $table.screenTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unlockCount => $composableBuilder(
    column: $table.unlockCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get walkingMinutes => $composableBuilder(
    column: $table.walkingMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sedentaryMinutes => $composableBuilder(
    column: $table.sedentaryMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nightUsageMinutes => $composableBuilder(
    column: $table.nightUsageMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get appOpenFrequency => $composableBuilder(
    column: $table.appOpenFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deviceInteractionFrequency => $composableBuilder(
    column: $table.deviceInteractionFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DailyMetricsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyMetricsTable,
          DailyMetric,
          $$DailyMetricsTableFilterComposer,
          $$DailyMetricsTableOrderingComposer,
          $$DailyMetricsTableAnnotationComposer,
          $$DailyMetricsTableCreateCompanionBuilder,
          $$DailyMetricsTableUpdateCompanionBuilder,
          (
            DailyMetric,
            BaseReferences<_$AppDatabase, $DailyMetricsTable, DailyMetric>,
          ),
          DailyMetric,
          PrefetchHooks Function()
        > {
  $$DailyMetricsTableTableManager(_$AppDatabase db, $DailyMetricsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyMetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyMetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyMetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> steps = const Value.absent(),
                Value<int> screenTimeMinutes = const Value.absent(),
                Value<int> unlockCount = const Value.absent(),
                Value<int> walkingMinutes = const Value.absent(),
                Value<int> sedentaryMinutes = const Value.absent(),
                Value<int> nightUsageMinutes = const Value.absent(),
                Value<int> appOpenFrequency = const Value.absent(),
                Value<int> deviceInteractionFrequency = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DailyMetricsCompanion(
                id: id,
                date: date,
                steps: steps,
                screenTimeMinutes: screenTimeMinutes,
                unlockCount: unlockCount,
                walkingMinutes: walkingMinutes,
                sedentaryMinutes: sedentaryMinutes,
                nightUsageMinutes: nightUsageMinutes,
                appOpenFrequency: appOpenFrequency,
                deviceInteractionFrequency: deviceInteractionFrequency,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<int> steps = const Value.absent(),
                Value<int> screenTimeMinutes = const Value.absent(),
                Value<int> unlockCount = const Value.absent(),
                Value<int> walkingMinutes = const Value.absent(),
                Value<int> sedentaryMinutes = const Value.absent(),
                Value<int> nightUsageMinutes = const Value.absent(),
                Value<int> appOpenFrequency = const Value.absent(),
                Value<int> deviceInteractionFrequency = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DailyMetricsCompanion.insert(
                id: id,
                date: date,
                steps: steps,
                screenTimeMinutes: screenTimeMinutes,
                unlockCount: unlockCount,
                walkingMinutes: walkingMinutes,
                sedentaryMinutes: sedentaryMinutes,
                nightUsageMinutes: nightUsageMinutes,
                appOpenFrequency: appOpenFrequency,
                deviceInteractionFrequency: deviceInteractionFrequency,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyMetricsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyMetricsTable,
      DailyMetric,
      $$DailyMetricsTableFilterComposer,
      $$DailyMetricsTableOrderingComposer,
      $$DailyMetricsTableAnnotationComposer,
      $$DailyMetricsTableCreateCompanionBuilder,
      $$DailyMetricsTableUpdateCompanionBuilder,
      (
        DailyMetric,
        BaseReferences<_$AppDatabase, $DailyMetricsTable, DailyMetric>,
      ),
      DailyMetric,
      PrefetchHooks Function()
    >;
typedef $$RiskPredictionsTableCreateCompanionBuilder =
    RiskPredictionsCompanion Function({
      Value<int> id,
      required DateTime date,
      required double stressScore,
      required double sleepScore,
      required double wellnessScore,
      required double confidence,
      Value<DateTime> createdAt,
    });
typedef $$RiskPredictionsTableUpdateCompanionBuilder =
    RiskPredictionsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double> stressScore,
      Value<double> sleepScore,
      Value<double> wellnessScore,
      Value<double> confidence,
      Value<DateTime> createdAt,
    });

class $$RiskPredictionsTableFilterComposer
    extends Composer<_$AppDatabase, $RiskPredictionsTable> {
  $$RiskPredictionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get stressScore => $composableBuilder(
    column: $table.stressScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sleepScore => $composableBuilder(
    column: $table.sleepScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wellnessScore => $composableBuilder(
    column: $table.wellnessScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RiskPredictionsTableOrderingComposer
    extends Composer<_$AppDatabase, $RiskPredictionsTable> {
  $$RiskPredictionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get stressScore => $composableBuilder(
    column: $table.stressScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sleepScore => $composableBuilder(
    column: $table.sleepScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wellnessScore => $composableBuilder(
    column: $table.wellnessScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RiskPredictionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RiskPredictionsTable> {
  $$RiskPredictionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get stressScore => $composableBuilder(
    column: $table.stressScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sleepScore => $composableBuilder(
    column: $table.sleepScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get wellnessScore => $composableBuilder(
    column: $table.wellnessScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RiskPredictionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RiskPredictionsTable,
          RiskPrediction,
          $$RiskPredictionsTableFilterComposer,
          $$RiskPredictionsTableOrderingComposer,
          $$RiskPredictionsTableAnnotationComposer,
          $$RiskPredictionsTableCreateCompanionBuilder,
          $$RiskPredictionsTableUpdateCompanionBuilder,
          (
            RiskPrediction,
            BaseReferences<
              _$AppDatabase,
              $RiskPredictionsTable,
              RiskPrediction
            >,
          ),
          RiskPrediction,
          PrefetchHooks Function()
        > {
  $$RiskPredictionsTableTableManager(
    _$AppDatabase db,
    $RiskPredictionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RiskPredictionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RiskPredictionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RiskPredictionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> stressScore = const Value.absent(),
                Value<double> sleepScore = const Value.absent(),
                Value<double> wellnessScore = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RiskPredictionsCompanion(
                id: id,
                date: date,
                stressScore: stressScore,
                sleepScore: sleepScore,
                wellnessScore: wellnessScore,
                confidence: confidence,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required double stressScore,
                required double sleepScore,
                required double wellnessScore,
                required double confidence,
                Value<DateTime> createdAt = const Value.absent(),
              }) => RiskPredictionsCompanion.insert(
                id: id,
                date: date,
                stressScore: stressScore,
                sleepScore: sleepScore,
                wellnessScore: wellnessScore,
                confidence: confidence,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RiskPredictionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RiskPredictionsTable,
      RiskPrediction,
      $$RiskPredictionsTableFilterComposer,
      $$RiskPredictionsTableOrderingComposer,
      $$RiskPredictionsTableAnnotationComposer,
      $$RiskPredictionsTableCreateCompanionBuilder,
      $$RiskPredictionsTableUpdateCompanionBuilder,
      (
        RiskPrediction,
        BaseReferences<_$AppDatabase, $RiskPredictionsTable, RiskPrediction>,
      ),
      RiskPrediction,
      PrefetchHooks Function()
    >;
typedef $$BaselineMetricsTableCreateCompanionBuilder =
    BaselineMetricsCompanion Function({
      Value<int> id,
      required String metricName,
      required double mean,
      required double standardDeviation,
      required DateTime updatedAt,
    });
typedef $$BaselineMetricsTableUpdateCompanionBuilder =
    BaselineMetricsCompanion Function({
      Value<int> id,
      Value<String> metricName,
      Value<double> mean,
      Value<double> standardDeviation,
      Value<DateTime> updatedAt,
    });

class $$BaselineMetricsTableFilterComposer
    extends Composer<_$AppDatabase, $BaselineMetricsTable> {
  $$BaselineMetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metricName => $composableBuilder(
    column: $table.metricName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mean => $composableBuilder(
    column: $table.mean,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get standardDeviation => $composableBuilder(
    column: $table.standardDeviation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BaselineMetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $BaselineMetricsTable> {
  $$BaselineMetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metricName => $composableBuilder(
    column: $table.metricName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mean => $composableBuilder(
    column: $table.mean,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get standardDeviation => $composableBuilder(
    column: $table.standardDeviation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BaselineMetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BaselineMetricsTable> {
  $$BaselineMetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get metricName => $composableBuilder(
    column: $table.metricName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get mean =>
      $composableBuilder(column: $table.mean, builder: (column) => column);

  GeneratedColumn<double> get standardDeviation => $composableBuilder(
    column: $table.standardDeviation,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BaselineMetricsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BaselineMetricsTable,
          BaselineMetric,
          $$BaselineMetricsTableFilterComposer,
          $$BaselineMetricsTableOrderingComposer,
          $$BaselineMetricsTableAnnotationComposer,
          $$BaselineMetricsTableCreateCompanionBuilder,
          $$BaselineMetricsTableUpdateCompanionBuilder,
          (
            BaselineMetric,
            BaseReferences<
              _$AppDatabase,
              $BaselineMetricsTable,
              BaselineMetric
            >,
          ),
          BaselineMetric,
          PrefetchHooks Function()
        > {
  $$BaselineMetricsTableTableManager(
    _$AppDatabase db,
    $BaselineMetricsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BaselineMetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BaselineMetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BaselineMetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> metricName = const Value.absent(),
                Value<double> mean = const Value.absent(),
                Value<double> standardDeviation = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BaselineMetricsCompanion(
                id: id,
                metricName: metricName,
                mean: mean,
                standardDeviation: standardDeviation,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String metricName,
                required double mean,
                required double standardDeviation,
                required DateTime updatedAt,
              }) => BaselineMetricsCompanion.insert(
                id: id,
                metricName: metricName,
                mean: mean,
                standardDeviation: standardDeviation,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BaselineMetricsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BaselineMetricsTable,
      BaselineMetric,
      $$BaselineMetricsTableFilterComposer,
      $$BaselineMetricsTableOrderingComposer,
      $$BaselineMetricsTableAnnotationComposer,
      $$BaselineMetricsTableCreateCompanionBuilder,
      $$BaselineMetricsTableUpdateCompanionBuilder,
      (
        BaselineMetric,
        BaseReferences<_$AppDatabase, $BaselineMetricsTable, BaselineMetric>,
      ),
      BaselineMetric,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DailyMetricsTableTableManager get dailyMetrics =>
      $$DailyMetricsTableTableManager(_db, _db.dailyMetrics);
  $$RiskPredictionsTableTableManager get riskPredictions =>
      $$RiskPredictionsTableTableManager(_db, _db.riskPredictions);
  $$BaselineMetricsTableTableManager get baselineMetrics =>
      $$BaselineMetricsTableTableManager(_db, _db.baselineMetrics);
}
