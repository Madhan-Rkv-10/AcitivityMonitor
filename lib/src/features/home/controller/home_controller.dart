// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../auth/Repository/auth_repository.dart';
// import 'package:googleapis/calendar/v3.dart' as googleAPI;

// final homeController = ChangeNotifierProvider((ref) => HomeController());

// class HomeController extends ChangeNotifier {
//   final autuRespo = AuthRepository(googleSignIn: GoogleSignIn());

//   Future<List<googleAPI.Event>> getEvent() async {
//     final token = {
//       "Authorization":
//           "Bearer ya29.a0AfB_byCBLKqLeGP9B2JH639TKAxoQRrse4pWcwlXnLRkOQeJI_BbiKR_NeHlXkVw_RJNV7gPgRrXrZmm_kNFQBjCroloQEY0OKD1SSXeOkV461rhHhUjxclMDQ_lTHEdj58MNvyRMyUwknm-ZijKkrbflu7gngaCgYKAeQSARISFQHsvYlsfmUZAzduCY6K82ugx3rY1A0165"
//     };
//     final result = await autuRespo.getGoogleEventsData(token: token);
//     return result;
//   }
// }
