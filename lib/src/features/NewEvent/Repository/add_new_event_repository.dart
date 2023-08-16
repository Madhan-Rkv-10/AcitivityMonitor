import 'dart:developer';

import 'package:activity_monitor/src/features/auth/domain%20Model/error_model.dart';
import 'package:activity_monitor/src/features/home/repository/home_repository.dart';
import 'package:activity_monitor/src/utils/src/helpers/auth_helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/local_storage/key_value_storage_service.dart';
import '../../home/Services/api_header_services.dart';

class AddNewEventRepostory {
  Future<Either<Event, ErrorModel>> addevents(
      {required String calendarId,
      required Event event,
      required GoogleAPIClient client}) async {
    final google_api.CalendarApi calendarAPI = google_api.CalendarApi(client);

    try {
      final result = await calendarAPI.events.insert(event, calendarId);
      return left(result);
    } catch (e) {
      return right(ErrorModel(error: e.toString(), data: null));
    }
  }
}

class AddEventController extends ChangeNotifier {
  final repo = AddNewEventRepostory();
  ErrorModel? errorModel;
  final KeyValueStorageService storeService = KeyValueStorageService();
  DateTime? startTime;
  DateTime? endTime;
  Future<bool> addevent(
      {String? summary = "Sample",
      String? description,
      String? location}) async {
    try {
      final token = await storeService.getAuthToken();

      final tokenValue = UtilsHelpers.convertedToken(token);

      final GoogleAPIClient httpClient = GoogleAPIClient(tokenValue);
      final event = Event(
          summary: summary,
          description: description,
          location: "location",
          start: EventDateTime(
            dateTime: startTime,
          ),
          end: EventDateTime(
            dateTime: endTime,
          ));
      final result = await repo.addevents(
          calendarId: "primary", event: event, client: httpClient);
      return result.fold(
        (l) => true,
        (r) {
          errorModel = ErrorModel(error: r.toString(), data: null);
          return false;
        },
      );
    } catch (e) {
      return false;
    }
  }
}

final addEventControllerProvider =
    ChangeNotifierProvider((ref) => AddEventController());
