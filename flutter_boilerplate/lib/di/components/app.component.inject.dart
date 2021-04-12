import 'app.component.dart' as _i1;
import '../../module_localization/service/localization_service/localization_service.dart'
    as _i2;
import '../../utils/logger/logger.dart' as _i3;
import 'dart:async' as _i4;
import '../../main.dart' as _i5;
import '../../module_theme/service/theme_service/theme_service.dart' as _i6;
import '../../module_theme/pressistance/theme_preferences_helper.dart' as _i7;
import '../../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../../module_chat/chat_module.dart' as _i9;
import '../../module_chat/ui/screens/chat_page/chat_page.dart' as _i10;
import '../../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i11;
import '../../module_chat/service/chat/char_service.dart' as _i12;
import '../../module_chat/manager/chat/chat_manager.dart' as _i13;
import '../../module_chat/repository/chat/chat_repository.dart' as _i14;
import '../../module_auth/service/auth_service/auth_service.dart' as _i15;
import '../../module_auth/manager/auth_manager/auth_manager.dart' as _i16;
import '../../module_auth/repository/auth/auth_repository.dart' as _i17;
import '../../module_network/http_client/http_client.dart' as _i18;
import '../../module_auth/preferences/auth_pereferences.dart' as _i19;
import '../../module_upload/service/image_upload/image_upload_service.dart'
    as _i20;
import '../../module_upload/manager/upload_manager/upload_manager.dart' as _i21;
import '../../module_upload/repository/upload_repository/upload_repository.dart'
    as _i22;
import '../../module_settings/settings_module.dart' as _i23;
import '../../module_settings/ui/settings_page/settings_page.dart' as _i24;
import '../../module_auth/authoriazation_module.dart' as _i25;
import '../../module_auth/ui/screen/login_screen/auth_screen.dart' as _i26;
import '../../module_auth/state_manager/auth_state_manager/auth_state_manager.dart'
    as _i27;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._();

  _i2.LocalizationService _singletonLocalizationService;

  _i3.Logger _singletonLogger;

  static _i4.Future<_i1.AppComponent> create() async {
    final injector = AppComponent$Injector._();

    return injector;
  }

  _i5.MyApp _createMyApp() => _i5.MyApp(
      _createAppThemeDataService(),
      _createLocalizationService(),
      _createChatModule(),
      _createSettingsModule(),
      _createAuthorizationModule());
  _i6.AppThemeDataService _createAppThemeDataService() =>
      _i6.AppThemeDataService(_createThemePreferencesHelper());
  _i7.ThemePreferencesHelper _createThemePreferencesHelper() =>
      _i7.ThemePreferencesHelper();
  _i2.LocalizationService _createLocalizationService() =>
      _singletonLocalizationService ??=
          _i2.LocalizationService(_createLocalizationPreferencesHelper());
  _i8.LocalizationPreferencesHelper _createLocalizationPreferencesHelper() =>
      _i8.LocalizationPreferencesHelper();
  _i9.ChatModule _createChatModule() =>
      _i9.ChatModule(_createChatPage(), _createAuthService());
  _i10.ChatPage _createChatPage() => _i10.ChatPage(
      _createChatPageBloc(), _createAuthService(), _createImageUploadService());
  _i11.ChatPageBloc _createChatPageBloc() =>
      _i11.ChatPageBloc(_createChatService());
  _i12.ChatService _createChatService() =>
      _i12.ChatService(_createChatManager());
  _i13.ChatManager _createChatManager() =>
      _i13.ChatManager(_createChatRepository());
  _i14.ChatRepository _createChatRepository() => _i14.ChatRepository();
  _i15.AuthService _createAuthService() =>
      _i15.AuthService(_createAuthManager(), _createAuthPreferences());
  _i16.AuthManager _createAuthManager() =>
      _i16.AuthManager(_createAuthRepository());
  _i17.AuthRepository _createAuthRepository() =>
      _i17.AuthRepository(_createApiClient());
  _i18.ApiClient _createApiClient() => _i18.ApiClient(_createLogger());
  _i3.Logger _createLogger() => _singletonLogger ??= _i3.Logger();
  _i19.AuthPreferences _createAuthPreferences() => _i19.AuthPreferences();
  _i20.ImageUploadService _createImageUploadService() =>
      _i20.ImageUploadService(_createUploadManager());
  _i21.UploadManager _createUploadManager() =>
      _i21.UploadManager(_createUploadRepository());
  _i22.UploadRepository _createUploadRepository() => _i22.UploadRepository();
  _i23.SettingsModule _createSettingsModule() =>
      _i23.SettingsModule(_createSettingsScreen());
  _i24.SettingsScreen _createSettingsScreen() => _i24.SettingsScreen(
      _createAuthService(),
      _createLocalizationService(),
      _createAppThemeDataService());
  _i25.AuthorizationModule _createAuthorizationModule() =>
      _i25.AuthorizationModule(_createAuthScreen());
  _i26.AuthScreen _createAuthScreen() =>
      _i26.AuthScreen(_createAuthStateManager());
  _i27.AuthStateManager _createAuthStateManager() =>
      _i27.AuthStateManager(_createAuthService());
  @override
  _i5.MyApp get app => _createMyApp();
}
