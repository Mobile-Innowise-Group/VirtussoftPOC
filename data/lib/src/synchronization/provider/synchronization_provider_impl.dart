import 'package:shared_preferences/shared_preferences.dart';

import 'synchronization_provider.dart';

class SynchronizationProviderImpl implements SynchronizationProvider {
  static const String _firstLaunchKey = 'first_launch';

  @override
  Future<bool> isFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isFirstLaunch = prefs.getBool(_firstLaunchKey);
    return isFirstLaunch ?? true;
  }

  @override
  Future<void> setFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstLaunchKey, false);
  }
}
