part of 'app_utils.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class GlobalAPIKey {
  String baseUrl = 'https://tonyhart7.dev:3000';

  Future<String?> getAccessKey() async {
    final prefs = await _prefs;
    return prefs.getString('access_key');
  }

  Future<void> setAccessKey(String accessKey) async {
    final prefs = await _prefs;
    await prefs.setString('access_key', accessKey);
  }

  Future<void> delAccessKey() async {
    final prefs = await _prefs;
    await prefs.remove('access_key');
  }
}
