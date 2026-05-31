import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStateRepository {
  static const _setupCompleteKey = 'tacite_setup_complete';

  Future<bool> isSetupComplete() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_setupCompleteKey) ?? false;
  }

  Future<void> markSetupComplete() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool(_setupCompleteKey, true);
  }

  Future<void> resetSetupComplete() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(_setupCompleteKey);
  }
}
