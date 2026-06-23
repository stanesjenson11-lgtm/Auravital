import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

import 'core/background/background_tasks.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/notifications/data/local_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.instance.initialize();
  await Workmanager().initialize(callbackDispatcher);
  await Workmanager().registerPeriodicTask(
    BackgroundTasks.periodicTaskId,
    BackgroundTasks.periodicTaskName,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.notRequired),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
  );
  runApp(const ProviderScope(child: AuraVitalsApp()));
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    DartPluginRegistrant.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    return BackgroundTasks.runMonitoringCycle();
  });
}

class AuraVitalsApp extends ConsumerWidget {
  const AuraVitalsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'AuraVitals',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
