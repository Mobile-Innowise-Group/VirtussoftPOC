import 'package:biometrics/src/service/biometric_service.dart';
import 'package:get_it/get_it.dart';

final BiometricsDI biometricsDI = BiometricsDI();

class BiometricsDI {
  static void initBiometrics({required GetIt locator}) {
    locator.registerLazySingleton<BiometricService>(
      () => BiometricService(),
    );
  }
}
