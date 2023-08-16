import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../domain Model/error_model.dart';

abstract class AuthServices {
  Future<Either<GoogleSignInAccount, ErrorModel>> signInWithGoogle();
  Future<void> signOut();
}
