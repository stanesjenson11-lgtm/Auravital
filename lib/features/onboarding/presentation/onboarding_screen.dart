import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/app_providers.dart';
import '../data/onboarding_repository_impl.dart';
import '../domain/onboarding_page_model.dart';

final _onboardingRepositoryProvider = Provider<OnboardingRepositoryImpl>((ref) {
  return OnboardingRepositoryImpl(ref.watch(secureSettingsStoreProvider));
});

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  static const _pages = [
    OnboardingPageModel(
      title: 'Welcome to AuraVitals',
      points: ['Passive Health Monitoring', 'Privacy First Design', 'On Device AI'],
    ),
    OnboardingPageModel(
      title: 'Permissions Overview',
      points: ['Activity Recognition', 'Usage Access', 'Notifications'],
    ),
    OnboardingPageModel(
      title: 'Privacy Information',
      points: ['No cloud storage', 'No text collection', 'No audio collection', 'No location tracking'],
    ),
    OnboardingPageModel(
      title: 'Start Monitoring',
      points: ['Build a 14 day baseline', 'Detect meaningful changes', 'Receive private local alerts'],
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (value) => setState(() => _index = value),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: scheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.monitor_heart, size: 38, color: scheme.onPrimaryContainer),
                        ),
                        const SizedBox(height: 32),
                        Text(page.title, style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: 24),
                        for (final point in page.points)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: scheme.primary),
                                const SizedBox(width: 12),
                                Expanded(child: Text(point, style: Theme.of(context).textTheme.titleMedium)),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  for (var i = 0; i < _pages.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 240),
                      margin: const EdgeInsets.only(right: 8),
                      width: _index == i ? 28 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _index == i ? scheme.primary : scheme.outlineVariant,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  const Spacer(),
                  FilledButton.icon(
                    onPressed: () async {
                      if (_index < _pages.length - 1) {
                        await _controller.nextPage(duration: const Duration(milliseconds: 260), curve: Curves.easeOut);
                      } else {
                        await ref.read(_onboardingRepositoryProvider).complete();
                        if (context.mounted) context.go('/permissions');
                      }
                    },
                    icon: Icon(_index == _pages.length - 1 ? Icons.play_arrow : Icons.arrow_forward),
                    label: Text(_index == _pages.length - 1 ? 'Begin Calibration' : 'Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
