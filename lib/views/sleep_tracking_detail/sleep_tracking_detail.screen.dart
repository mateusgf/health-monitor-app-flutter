import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_monitor_app_flutter/views/sleep_tracking_detail/widgets/sleep_detail_content_widget.dart';
import 'package:health_monitor_app_flutter/models/app_theme.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';

final sleepThemeProvider = StateProvider<AppTheme>((ref) => AppTheme.light);

class SleepTrackingDetailScreen extends ConsumerWidget {
  const SleepTrackingDetailScreen({super.key, String? id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int id = 1;
    final sleepPhasesAsyncValue = ref.watch(sleepDetailRawProvider(id));
    final currentTheme = ref.watch(sleepThemeProvider);
    final themeColors = currentTheme == AppTheme.dark
        ? SleepThemeColors.dark
        : SleepThemeColors.light;

    final int sleepTime = 9 * 60 + 7; // 9 hours and 7 minutes total sleep time
    final sleepStartTime = 23 * 60 + 20; // Started to sleep at 23:20
    final sleepEndTime = 8 * 60 + 29; // Woke up at 8:29

    return Scaffold(
      backgroundColor: themeColors.background,
      appBar: AppBar(
        backgroundColor: themeColors.background,
        leading: IconButton(
          icon: Icon(Icons.close, color: themeColors.primaryText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Icon(Icons.nightlight_round,
                color: themeColors.primaryText, size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SLEEP',
                  style: TextStyle(
                    color: themeColors.primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '11:20 PM to 8:29 AM',
                  style: TextStyle(
                    color: themeColors.secondaryText,
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              currentTheme == AppTheme.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: themeColors.primaryText,
            ),
            onPressed: () {
              ref.read(sleepThemeProvider.notifier).state =
                  currentTheme == AppTheme.dark
                      ? AppTheme.light
                      : AppTheme.dark;
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: themeColors.primaryText),
            onPressed: () {},
          ),
        ],
      ),
      body: sleepPhasesAsyncValue.when(
        data: (sleepPhases) => SleepDetailContentWidget(
          sleepPhases: sleepPhases,
          sleepTime: sleepTime,
          sleepStartTime: sleepStartTime,
          sleepEndTime: sleepEndTime,
          themeColors: themeColors,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: $err',
              style: TextStyle(color: themeColors.primaryText)),
        ),
      ),
    );
  }
}
