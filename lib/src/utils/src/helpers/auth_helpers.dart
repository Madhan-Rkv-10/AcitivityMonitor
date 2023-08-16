import '../../../services/local_storage/key_value_storage_service.dart';

final c = KeyValueStorageService();

abstract class UtilsHelpers {
  static Map<String, String> convertedToken(String value) {
    return {"Authorization": value};
  }

  // static Future<Map<String, String>> getTokenHeader() async {
  //   final tokenValue = await c.getAuthToken();
  //   final value = {"Authorization": tokenValue};

  //   return value;
  // }
}
