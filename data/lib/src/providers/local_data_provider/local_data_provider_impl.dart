import 'package:shared_preferences/shared_preferences.dart';

import '../../../data.dart';

class LocalDataProviderImpl implements LocalDataProvider {
  final SharedPreferences _prefs;

  LocalDataProviderImpl({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  @override
  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _prefs.setString(
      key,
      value,
    );
  }

  @override
  Future<String?> read({
    required String key,
  }) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> delete({
    required String key,
  }) async {
    await _prefs.remove(key);
  }
}
