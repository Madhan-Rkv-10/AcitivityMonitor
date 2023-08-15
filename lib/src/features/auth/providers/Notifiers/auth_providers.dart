import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../services/local_storage/key_value_storage_service.dart';
import '../state_controllers/auth_controller.dart';

final authController = ChangeNotifierProvider((ref) => AuthController());
final keyValueStorageProvider = Provider((ref) => KeyValueStorageService());
