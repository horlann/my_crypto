abstract class ISettingsRepository {
  const ISettingsRepository();

  Future<void> updateTheme();

  Future<String> loadCurrentTheme();

}
