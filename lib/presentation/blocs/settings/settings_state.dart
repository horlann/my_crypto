class SettingsState {
  SettingsState init() {
    return SettingsState();
  }

  SettingsState clone() {
    return SettingsState();
  }

  SettingsState updateNumber(int number) {
    return UpdateNumberState(number);
  }
}
class UpdateNumberState extends SettingsState{
  final int number;

  UpdateNumberState(this.number);
}