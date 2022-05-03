class AppStarterState {
  const AppStarterState();

  AppStarterState init() {
    return const AppStarterState();
  }

  AppStarterState clone() {
    return const AppStarterState();
  }

  AppStarterState canStartAppState(bool result) {
    return CanStartAppState(result);
  }
}

class CanStartAppState extends AppStarterState {
  const CanStartAppState(this.result);

  final bool result;
}