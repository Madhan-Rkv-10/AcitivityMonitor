import 'package:googleapis/calendar/v3.dart' as google_api;
import '../Services/api_header_services.dart';
import '../Services/home_services.dart';

class HomeRepository implements HomeServices {
  @override
  Future<List<google_api.Event>> getGoogleEventsData(
      {Map<String, String>? token}) async {
    final GoogleAPIClient httpClient = GoogleAPIClient(token!);
    final google_api.CalendarApi calendarAPI =
        google_api.CalendarApi(httpClient);

    final google_api.Events calEvents = await calendarAPI.events.list(
      "primary",
    );
    final List<google_api.Event> appointments = <google_api.Event>[];
    if (calEvents.items != null) {
      for (int i = 0; i < calEvents.items!.length; i++) {
        final google_api.Event event = calEvents.items![i];
        if (event.start == null) {
          continue;
        }
        appointments.add(event);
      }
    }
    return appointments;
  }
}
