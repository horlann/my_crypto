import 'package:my_crypto/data/api/db_api/local/shards_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAppSettingsDao {
  abstract final String? themeMode;

  Future<void> setThemeMode(String value);
}

class AppSettingsDao extends SharedPreferencesDao implements IAppSettingsDao {
  AppSettingsDao(SharedPreferences sharedPreferences) : super(sharedPreferences);

  String get _isThemeLightKey => key('is_theme_light');

  @override
  String? get themeMode => getString(_isThemeLightKey);

  @override
  Future<void> setThemeMode(String value) => setString(_isThemeLightKey, value);
}
