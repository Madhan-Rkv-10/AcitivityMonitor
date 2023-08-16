import 'dart:developer';

import 'package:activity_monitor/src/features/auth/providers/Notifiers/auth_providers.dart';
import 'package:activity_monitor/src/routing/route_constants.dart';
import 'package:activity_monitor/src/utils/src/extensions/color_extension.dart';
import 'package:activity_monitor/src/utils/src/helpers/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/providers/home_providers.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final allEventsData = ref.watch(allEvents);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("ActivityMonitor"),
        backgroundColor: Colors.purple.shade100,
        actions: [
          IconButton(
            onPressed: () async {
              void pusAuthScreen() {
                Navigator.pushReplacementNamed(
                    context, RouteConstants.authScreen);
              }

              final result = await ref.read(authController).signOut();
              log("SuccessfullySignOut$result");
              if (result) {
                ref.read(keyValueStorageProvider).resetKeys();

                if (context.mounted) {
                  Navigator.pushReplacementNamed(
                      context, RouteConstants.authScreen);
                }
              }
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Your Events",
              style: context.textThemes.headlineMedium,
            ).paddingSymmetric(horizontal: 10, vertical: 5),
            SizedBox(
              height: context.screenHeight * 0.4,
              child: ref.watch(allEvents).when(
                  data: (events) {
                    return Scrollbar(
                      child: ListView.builder(
                          itemCount: events.length,
                          itemBuilder: ((context, index) {
                            final event = events.elementAt(index);
                            return Card(
                                child: ListTile(
                              title: Text(
                                event.summary.toString(),
                              ),
                              subtitle: Text(event.created.toString()),
                            )
                                // Text(event.creator!.email.toString()).paddingAll(10),
                                );
                          })),
                    );
                  },
                  error: (e, t) {
                    return Text(e.toString());
                  },
                  loading: () => const LinearProgressIndicator()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstants.newEvent);
        },
        shape: const StadiumBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
