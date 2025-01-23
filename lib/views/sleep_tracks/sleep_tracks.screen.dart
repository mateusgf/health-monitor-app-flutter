import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/providers/repositories.provider.dart';
import 'package:health_monitor_app_flutter/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SleepTracks extends ConsumerWidget {
  const SleepTracks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTracksAsync = ref.watch(sleepTracksProvider);

    String formatDate(DateTime dateISO) {
      var format = DateFormat.MMMEd();
      return format.format(dateISO);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sleep History')),
      body: sleepTracksAsync.when(
        data: (sleepTracks) => ListView.builder(
          itemCount: sleepTracks.length,
          itemBuilder: (context, index) {
            final track = sleepTracks[index];
            return ListTile(
              title: Text('Sleep Score: ${track.score}'),
              subtitle: Text(
                '${formatDate(track.start)}. Duration in minutes: (${track.durationInMinutes / 60}h)',
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
