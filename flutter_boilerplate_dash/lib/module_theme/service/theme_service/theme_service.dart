import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pasco_shipping/module_theme/pressistance/theme_preferences_helper.dart';

@injectable
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
    return Color(0xFF656565);
  }

  static Color get PrimaryDarker {
    return Color(0xFF2D7DFF);
  }

  static Color get AccentColor {
    return Color(0xD7007BFF);
  }

  ThemeData getActiveTheme()  {
    var dark =  _preferencesHelper.isDarkMode();
    if (dark == true) {
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor,
        primaryColorDark: PrimaryDarker,
        accentColor: AccentColor,
        appBarTheme: AppBarTheme(
          // centerTitle: true,
          textTheme: TextTheme(),
          // brightness: Brightness.dark,
          color: AccentColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: AccentColor ,selectionColor: AccentColor,selectionHandleColor: AccentColor),
      );
    }
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryDarker,
      accentColor: AccentColor,
      appBarTheme: AppBarTheme(color: AccentColor , titleTextStyle: White14text),
        textSelectionTheme: TextSelectionThemeData(cursorColor: AccentColor ,selectionColor: Colors.white ,selectionHandleColor: Colors.white)
    );
  }

  Future<void> switchDarkMode(bool darkMode) async {
    if (darkMode) {
      await _preferencesHelper.setDarkMode();
    } else {
      await _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}
