import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../../core.dart';

class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics() async {
    bool isAuthenticated = false;
    final bool canAuthenticateWithBiometrics =
        await _localAuth.canCheckBiometrics;

    if (!canAuthenticateWithBiometrics) {
      return isAuthenticated;
    }

    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'biometrics.pleaseAuthenticate'.tr(),
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return isAuthenticated;
  }
}
