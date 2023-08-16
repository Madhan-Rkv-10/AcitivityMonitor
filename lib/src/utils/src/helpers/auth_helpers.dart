abstract class AuthHelpers {
  static Map<String, String> convertedToken(String value) {
    return {"Authorization": value};
  }
}
