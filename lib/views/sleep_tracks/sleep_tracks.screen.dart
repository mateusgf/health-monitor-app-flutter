import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SleepTracks extends ConsumerWidget {
  const SleepTracks({super.key});

  void goToSleepDetailRoute(WidgetRef ref) {
    // @TODO: get real id
    ref.read(routerProvider).go(appRoutesPath(AppRoute.sleep_details, id: '1'));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTracksAsync = ref.watch(sleepTracksProvider);

    String formatDate(DateTime dateISO) {
      var format = DateFormat.MMMEd();
      return format.format(dateISO);
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.sleep_history.screen_title)),
      body: sleepTracksAsync.when(
        data: (sleepTracks) => ListView.builder(
          itemCount: sleepTracks.length,
          itemBuilder: (context, index) {
            final track = sleepTracks[index];
            return ListTile(
              title: Text('${t.sleep_history.sleep_score}: ${track.score}'),
              subtitle: Text(
                '${formatDate(track.start)}. ${t.sleep_history.duration_in_minutes}: (${track.durationInMinutes / 60}h)',
              ),
              onTap: () => goToSleepDetailRoute(ref),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
