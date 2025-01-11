import 'package:health_monitor_app_flutter/repositories/local_data.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDataRepositoryProvider = Provider<LocalDataRepository>((_) {
  return LocalDataRepository();
});
