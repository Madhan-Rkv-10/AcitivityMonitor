import 'package:activity_monitor/src/features/home/repository/home_repository.dart';
import 'package:activity_monitor/src/utils/src/helpers/auth_helpers.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;

import '../../../../services/local_storage/key_value_storage_service.dart';

class HomeController extends ChangeNotifier {
  final homeRepository = HomeRepository();
  final KeyValueStorageService _keyValueStorageService =
      KeyValueStorageService();
  Future<List<google_api.Event>> getAllEvents() async {
    final tokenValue = await _keyValueStorageService.getAuthToken();
    final result = await homeRepository.getGoogleEventsData(
        token: AuthHelpers.convertedToken(tokenValue));
    return result;
  }
}
