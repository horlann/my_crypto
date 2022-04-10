import 'dart:ui';

import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';

class LightTheme implements AbstractTheme {
  @override
  Color get backgroundColor => const Color(0xFFeff2f6);

  @override
  Color get infoTextColor => const Color(0xFF1a191e);

  @override
  Color get inactiveTextColor => const Color(0xFF6f6e75);

  @override
  Color get cardColor => const Color(0xFFf9f8fd);

  @override
  Color get wrongColor => const Color(0xFFc85648);

  @override
  Color get rightColor => const Color(0xFF24ad65);
}
