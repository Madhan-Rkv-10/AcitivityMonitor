import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../stateController/home_controller.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;

final homeController = ChangeNotifierProvider((ref) => HomeController());
final allEvents = FutureProvider<List<google_api.Event>>((ref) {
  final homeControllers = ref.read(homeController);
  return homeControllers.getAllEvents();
});
