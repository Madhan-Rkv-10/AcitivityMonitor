import 'package:googleapis/calendar/v3.dart' as google_api;

abstract class HomeServices {
  Future<List<google_api.Event>> getGoogleEventsData();
}
