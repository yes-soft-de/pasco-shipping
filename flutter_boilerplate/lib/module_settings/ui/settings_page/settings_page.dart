import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_auth/authorization_routes.dart';
import 'package:pasco_shipping/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_localization/service/localization_service/localization_service.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class SettingsScreen extends StatefulWidget {
  final AuthService _authService;
  final LocalizationService _localizationService;
  final AppThemeDataService _themeDataService;
  final FireNotificationService _notificationService;

  SettingsScreen(
      this._authService,
      this._localizationService,
      this._themeDataService,
      this._notificationService,
      );

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loading = false;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Background(
        goBack: ()  {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:AppThemeDataService.AccentColor,
                ),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text(S.of(context).language),
                      trailing: DropdownButton(
                          value: Localizations.localeOf(context).languageCode,
                          underline: Container(),
                          icon: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.arrow_drop_down_rounded),
                          ),
                          items: [
                            DropdownMenuItem(
                              child: Text('العربية'),
                              value: 'ar',
                            ),
                            DropdownMenuItem(
                              child: Text('English'),
                              value: 'en',
                            ),
                          ],
                          onChanged: (newLang) {
                              widget._localizationService
                                  .setLanguage(newLang.toString());

                          }),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_rounded),
                      title: Text(S.of(context).logout),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Icon(Icons.logout_rounded),
                      ),
                      onTap: () {
                        widget._authService.logout().then((value) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AuthorizationRoutes.LOGIN_SCREEN, (route) => false);
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        title: S.of(context).setting,
      currentIndex: -1,
      isResultScreen: false, isHome: false, controller: controller,
    );

  }
}
