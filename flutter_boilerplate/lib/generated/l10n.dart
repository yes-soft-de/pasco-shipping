// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `I have an account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have an account',
      name: 'iHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `GET STARTED`
  String get getStarted {
    return Intl.message(
      'GET STARTED',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordIsTooShort {
    return Intl.message(
      'Password is too short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPass {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `this filed is required`
  String get required {
    return Intl.message(
      'this filed is required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `I have no account? sign up`
  String get noAccount {
    return Intl.message(
      'I have no account? sign up',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `resend code`
  String get resendCode {
    return Intl.message(
      'resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `pleas input phone number`
  String get pleaseInputPhoneNumber {
    return Intl.message(
      'pleas input phone number',
      name: 'pleaseInputPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `confirm Code`
  String get confirmCode {
    return Intl.message(
      'confirm Code',
      name: 'confirmCode',
      desc: '',
      args: [],
    );
  }

  /// `Success!!!`
  String get success {
    return Intl.message(
      'Success!!!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `You are logged in successfully`
  String get loggedIn {
    return Intl.message(
      'You are logged in successfully',
      name: 'loggedIn',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Shipments`
  String get shipment {
    return Intl.message(
      'Shipments',
      name: 'shipment',
      desc: '',
      args: [],
    );
  }

  /// `My\n Shipments`
  String get myShipment {
    return Intl.message(
      'My\n Shipments',
      name: 'myShipment',
      desc: '',
      args: [],
    );
  }

  /// `Request a new\n shipment`
  String get newShipmentRequest {
    return Intl.message(
      'Request a new\n shipment',
      name: 'newShipmentRequest',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Marks`
  String get mark {
    return Intl.message(
      'Marks',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Direct support`
  String get directSupport {
    return Intl.message(
      'Direct support',
      name: 'directSupport',
      desc: '',
      args: [],
    );
  }

  /// `Enter the shipment number`
  String get enterShipmentNumber {
    return Intl.message(
      'Enter the shipment number',
      name: 'enterShipmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contact Info`
  String get contactInfo {
    return Intl.message(
      'Contact Info',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Term Of Service`
  String get termOfService {
    return Intl.message(
      'Term Of Service',
      name: 'termOfService',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Enter new mark`
  String get enterMark {
    return Intl.message(
      'Enter new mark',
      name: 'enterMark',
      desc: '',
      args: [],
    );
  }

  /// `Previous Mark`
  String get previousMark {
    return Intl.message(
      'Previous Mark',
      name: 'previousMark',
      desc: '',
      args: [],
    );
  }

  /// `You cannot delete previously used marks`
  String get deletePreviousMark {
    return Intl.message(
      'You cannot delete previously used marks',
      name: 'deletePreviousMark',
      desc: '',
      args: [],
    );
  }

  /// `My Previous`
  String get myPrevious {
    return Intl.message(
      'My Previous',
      name: 'myPrevious',
      desc: '',
      args: [],
    );
  }

  /// `country`
  String get country {
    return Intl.message(
      'country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Save Information`
  String get saveInfo {
    return Intl.message(
      'Save Information',
      name: 'saveInfo',
      desc: '',
      args: [],
    );
  }

  /// `Result tracking`
  String get resultTrack {
    return Intl.message(
      'Result tracking',
      name: 'resultTrack',
      desc: '',
      args: [],
    );
  }

  /// `Tracking the shipment`
  String get trackShipment {
    return Intl.message(
      'Tracking the shipment',
      name: 'trackShipment',
      desc: '',
      args: [],
    );
  }

  /// `Important note`
  String get importantNote {
    return Intl.message(
      'Important note',
      name: 'importantNote',
      desc: '',
      args: [],
    );
  }

  /// `Is in one holder`
  String get inHolder {
    return Intl.message(
      'Is in one holder',
      name: 'inHolder',
      desc: '',
      args: [],
    );
  }

  /// `Import warehouse city: `
  String get ImportWarehouseCity {
    return Intl.message(
      'Import warehouse city: ',
      name: 'ImportWarehouseCity',
      desc: '',
      args: [],
    );
  }

  /// `start writing`
  String get startWriting {
    return Intl.message(
      'start writing',
      name: 'startWriting',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `dark mode`
  String get darkMode {
    return Intl.message(
      'dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `fill all filed`
  String get fillAllField {
    return Intl.message(
      'fill all filed',
      name: 'fillAllField',
      desc: '',
      args: [],
    );
  }

  /// `Request Shipment`
  String get requestShipment {
    return Intl.message(
      'Request Shipment',
      name: 'requestShipment',
      desc: '',
      args: [],
    );
  }

  /// `Shipping type:`
  String get shippingType {
    return Intl.message(
      'Shipping type:',
      name: 'shippingType',
      desc: '',
      args: [],
    );
  }

  /// `Sea`
  String get sea {
    return Intl.message(
      'Sea',
      name: 'sea',
      desc: '',
      args: [],
    );
  }

  /// `Air`
  String get air {
    return Intl.message(
      'Air',
      name: 'air',
      desc: '',
      args: [],
    );
  }

  /// `Shipping from:`
  String get shippingFrom {
    return Intl.message(
      'Shipping from:',
      name: 'shippingFrom',
      desc: '',
      args: [],
    );
  }

  /// `Shipping to:`
  String get shippingTo {
    return Intl.message(
      'Shipping to:',
      name: 'shippingTo',
      desc: '',
      args: [],
    );
  }

  /// `Product type:`
  String get productType {
    return Intl.message(
      'Product type:',
      name: 'productType',
      desc: '',
      args: [],
    );
  }

  /// `Quantity:`
  String get quantity {
    return Intl.message(
      'Quantity:',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Image:`
  String get image {
    return Intl.message(
      'Image:',
      name: 'image',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
