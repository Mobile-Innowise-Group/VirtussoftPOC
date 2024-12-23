import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics() async {
    bool isAuthenticated = false;

    final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
    final bool isDeviceSupported = await _localAuth.isDeviceSupported();

    if (!canAuthenticateWithBiometrics || !isDeviceSupported) {
      return isAuthenticated;
    }

    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'biometrics.pleaseAuthenticate'.tr(),
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return isAuthenticated;
  }
}
