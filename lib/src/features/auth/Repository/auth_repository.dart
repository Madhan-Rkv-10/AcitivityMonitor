import 'dart:developer';

import 'package:activity_monitor/src/services/local_storage/key_value_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:googleapis/calendar/v3.dart' as googleAPI;
import 'package:fpdart/fpdart.dart';
import '../domain Model/error_model.dart';
import '../domain Model/user_model.dart';
import 'package:http/io_client.dart' show IOClient, IOStreamedResponse;

final authRepoProvider =
    Provider((ref) => AuthRepository(googleSignIn: GoogleSignIn()));
// final userProvider = NotifierProvider<UserResponseModel?>((ref) => null);

abstract class AuthServices {
  Future<Either<GoogleSignInAccount, ErrorModel>> signInWithGoogle();
  Future<List<googleAPI.Event>> getGoogleEventsData();
  Future<void> signOut();
}

class AuthRepository implements AuthServices {
  final GoogleSignIn _googleSignIn;

  AuthRepository({required GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn;
  GoogleSignInAccount? account;
  // late var
  @override
  Future<Either<GoogleSignInAccount, ErrorModel>> signInWithGoogle() async {
    account = await _googleSignIn.signIn();
    // print("account$account");
    account?.authHeaders.then((value) => value.forEach((key, value) {
          log("Key$key:$value");
        }));
    // print(account?.authHeaders.then((value) => print(value.entries.first)));
    // print(account?.authHeaders.then((value) => print(value.keys)));
    // print(account?.authHeaders.whenComplete(() => g.));
    try {
      if (account != null) {
        return left(account!);
      } else {
        return right(ErrorModel(error: "User is null", data: null));
      }
    } catch (e) {
      return right(ErrorModel(error: "Failed to Authenticate", data: null));
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  @override
  Future<List<googleAPI.Event>> getGoogleEventsData(
      {Future<Map<String, String>>? header, Map<String, String>? token}) async {
    log("THe header data ${header}");
    header?.then((value) => value.forEach((key, value) {
          log("Key$key:$value");
        }));

    // final calendarService = ();
    final token = {
      "Authorization":
          "Bearer ya29.a0AfB_byCBLKqLeGP9B2JH639TKAxoQRrse4pWcwlXnLRkOQeJI_BbiKR_NeHlXkVw_RJNV7gPgRrXrZmm_kNFQBjCroloQEY0OKD1SSXeOkV461rhHhUjxclMDQ_lTHEdj58MNvyRMyUwknm-ZijKkrbflu7gngaCgYKAeQSARISFQHsvYlsfmUZAzduCY6K82ugx3rY1A0165"
    };
    final GoogleAPIClient httpClient = GoogleAPIClient(token);
    final googleAPI.CalendarApi calendarAPI = googleAPI.CalendarApi(httpClient);

    final googleAPI.Events calEvents = await calendarAPI.events.list(
      "primary",
    );
    final List<googleAPI.Event> appointments = <googleAPI.Event>[];
    if (calEvents != null && calEvents.items != null) {
      for (int i = 0; i < calEvents.items!.length; i++) {
        final googleAPI.Event event = calEvents.items![i];
        if (event.start == null) {
          continue;
        }
        appointments.add(event);
      }
    }
    //  final  addEvent = await calendarAPI.events.insert(Event(summary: ""), calendarAPI.);
    log(appointments.toString());
    return appointments;
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url,
          headers: (headers != null ? (headers..addAll(_headers)) : headers));
}
