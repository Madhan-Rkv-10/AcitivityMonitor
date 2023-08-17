import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:fpdart/fpdart.dart';
import '../../../services/local_storage/key_value_storage_service.dart';
import '../Services/auth_services.dart';
import '../domain Model/error_model.dart';

class AuthRepository implements AuthServices {
  GoogleSignInAccount? account;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final KeyValueStorageService _keyValueStorageService =
      KeyValueStorageService();

  @override
  Future<Either<GoogleSignInAccount, ErrorModel>> signInWithGoogle() async {
    try {
      account = await _googleSignIn.signIn();
      await account?.authHeaders.then((value) {
        _keyValueStorageService.setAuthToken(value.entries.first.value);
        log(value.entries.first.value);
      });
      if (account != null) {
        return left(account!);
      } else {
        return right(ErrorModel(error: "User is null", data: null));
      }
    } catch (e) {
      return right(ErrorModel(error: e.toString(), data: null));
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
