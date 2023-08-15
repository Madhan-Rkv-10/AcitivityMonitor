import 'dart:developer';

import 'package:activity_monitor/src/features/auth/providers/Notifiers/auth_providers.dart';
import 'package:flutter/material.dart';
// import 'package:googleapis/calendar/v3.dart' ;
import 'package:googleapis_auth/auth_io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:url_launcher/url_launcher.dart';

import '../../auth/Repository/auth_repository.dart';
import '../../auth/providers/state_controllers/auth_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller
    // final value = ref.watch(allEvents);
    // final controller = ref.watch(authRepoProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Home Page"),
            ),
            TextButton(
                onPressed: () async {
                  await ref.read(authRepoProvider).signOut();
                  ref.read(keyValueStorageProvider).resetKeys();
                },
                child: Text("Logout"))

            // Container(
            //   height: 150,
            //   width: 300,
            //   child: value.when(
            //       data: (data) {
            //         log(data.toString());
            //         return Text(data.toString());
            //       },
            //       error: (error, t) {},
            //       loading: () => CircularProgressIndicator()),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        shape: const StadiumBorder(),
        onPressed: () async {
          final value = await ref.read(authController).getEvent();
          // print(value[0]);
          // final res = await _getAuthClient();
          // if (res) {
          //   print("added Successfully");
          // } else {
          //   print("Error Occured ");
          // }
        },
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Future<bool> _getAuthClient() async {
//   try {
//     final httpClient = await clientViaApplicationDefaultCredentials(
//       scopes: [
//         calendar.CalendarApi.calendarScope,
//       ],
//     );
//     // const scopes = [calendar.CalendarApi.calendarScope];
//     // final credential = ClientId(
//     //     "816943942940-5c0llr5a13r869dud31rr7mopctjmt2r.apps.googleusercontent.com",
//     //     "");
//     clientViaApiKey("AIzaSyCVG2xQaTciL1Dfz2qjtivyn3vlw36XnUc",
//         baseClient: httpClient);

//     // clientViaUserConsent(credential, scopes, prompt).then((client) {
//     //   final d = calendar.CalendarApi(client);
//     //   final events = calendar.Event();
//     //   events.summary = "madhanCalendar";
//     //   calendar.EventDateTime start =
//     //       calendar.EventDateTime() //Setting start time
//     //         ..dateTime = DateTime(2023, 8, 1, 12, 37)
//     //         ..timeZone = "GMT+05:30";
//     //   calendar.EventDateTime end = calendar.EventDateTime(); //setting end time
//     //   end.timeZone = "GMT+05:30";
//     //   end.dateTime = DateTime.now();
//     //   events.start = start;
//     //   events.end = end;
//     //   d.events.insert(events, "madhanrkv10@gmail.com").then((value) {
//     //     if (value.status == "confirmed") {
//     //       log('Event added in google calendar');
//     //     } else {
//     //       log("Unable to add event in google calendar");
//     //     }
//     //   });
//     // });

//     return true;
//   } catch (e) {
//     return false;
//   }
// }

void prompt(String url) async {
  print("Please go to the following URL and grant access:");
  print("  => $url");
  print("");

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
// clientViaUserConsent(credentials, scopes, prompt)