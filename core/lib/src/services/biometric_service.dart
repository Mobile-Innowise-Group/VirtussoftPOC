import 'package:local_auth/local_auth.dart';

import '../../core.dart';

class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics() async {
    final bool canAuthenticateWithBiometrics =
        await _localAuth.canCheckBiometrics;
    final bool isDeviceSupported = await _localAuth.isDeviceSupported();

    if (!canAuthenticateWithBiometrics && !isDeviceSupported) {
      return false;
    }

    return _localAuth.authenticate(
      localizedReason: 'biometrics.pleaseAuthenticate'.tr(),
      options: const AuthenticationOptions(
        stickyAuth: true,
      ),
    );
  }
}
