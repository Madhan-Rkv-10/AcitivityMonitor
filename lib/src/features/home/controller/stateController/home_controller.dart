import 'package:activity_monitor/src/features/home/repository/home_repository.dart';
import 'package:activity_monitor/src/services/local_storage/key_value_storage_service.dart';
import 'package:activity_monitor/src/utils/src/helpers/auth_helpers.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;

class HomeController extends ChangeNotifier {
  final KeyValueStorageService storeService = KeyValueStorageService();
  final homeRepository = HomeRepository();

  Future<List<google_api.Event>> getAllEvents() async {
    final token = await storeService.getAuthToken();

    final tokenValue = UtilsHelpers.convertedToken(token);
    final result = await homeRepository.getGoogleEventsData(token: tokenValue);
    return result;
  }
}
