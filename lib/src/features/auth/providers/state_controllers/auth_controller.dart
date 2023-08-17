import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Repository/auth_repository.dart';
import '../../domain Model/error_model.dart';
import '../../domain Model/user_model.dart';
import 'package:googleapis/calendar/v3.dart' as googleAPI;

class AuthController with ChangeNotifier {
  final autuRespo = AuthRepository();
  UserResponseModel? userResponseModel;
  ErrorModel? errorModel;
  var header;
  Future<bool> signInWithGoogle() async {
    final result = await autuRespo.signInWithGoogle();
    return result.fold(
      (l) {
        userResponseModel = UserResponseModel(
            email: l.email,
            name: l.displayName!,
            profilePic: l.photoUrl ?? '',
            token: '',
            uid: '');
        header = l.authHeaders;
        return true;
      },
      (r) {
        errorModel = r;
        return false;
      },
    );
  }

  Future<bool> signOut() async {
    final result = await autuRespo.signOut();
    return result;
  }
}
