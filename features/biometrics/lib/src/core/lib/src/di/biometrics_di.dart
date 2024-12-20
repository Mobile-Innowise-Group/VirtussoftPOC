import 'package:get_it/get_it.dart';

import '../../../../service/biometric_service.dart';

final BiometricsDI biometricsDI = BiometricsDI();

class BiometricsDI {
  static void initBiometrics({required GetIt locator}) {
    locator.registerLazySingleton<BiometricService>(
      BiometricService.new,
    );
  }
}
