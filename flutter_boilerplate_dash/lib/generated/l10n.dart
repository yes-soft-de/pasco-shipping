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
  String get marks {
    return Intl.message(
      'Marks',
      name: 'marks',
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

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
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
  String get importWarehouseCity {
    return Intl.message(
      'Import warehouse city: ',
      name: 'importWarehouseCity',
      desc: '',
      args: [],
    );
  }

  /// `Distributor Name: `
  String get distributorName {
    return Intl.message(
      'Distributor Name: ',
      name: 'distributorName',
      desc: '',
      args: [],
    );
  }

  /// `Shipment Info`
  String get shipmentInfo {
    return Intl.message(
      'Shipment Info',
      name: 'shipmentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Review Shipment`
  String get reviewShipment {
    return Intl.message(
      'Review Shipment',
      name: 'reviewShipment',
      desc: '',
      args: [],
    );
  }

  /// `name here`
  String get nameHere {
    return Intl.message(
      'name here',
      name: 'nameHere',
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

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
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

  /// `Shipping from: `
  String get shippingFrom {
    return Intl.message(
      'Shipping from: ',
      name: 'shippingFrom',
      desc: '',
      args: [],
    );
  }

  /// `Shipping to: `
  String get shippingTo {
    return Intl.message(
      'Shipping to: ',
      name: 'shippingTo',
      desc: '',
      args: [],
    );
  }

  /// `Product type: `
  String get productType {
    return Intl.message(
      'Product type: ',
      name: 'productType',
      desc: '',
      args: [],
    );
  }

  /// `Quantity: `
  String get quantity {
    return Intl.message(
      'Quantity: ',
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

  /// `Countries`
  String get countries {
    return Intl.message(
      'Countries',
      name: 'countries',
      desc: '',
      args: [],
    );
  }

  /// `Distributors`
  String get distributors {
    return Intl.message(
      'Distributors',
      name: 'distributors',
      desc: '',
      args: [],
    );
  }

  /// `Proxies`
  String get proxies {
    return Intl.message(
      'Proxies',
      name: 'proxies',
      desc: '',
      args: [],
    );
  }

  /// `Warehouse`
  String get warehouses {
    return Intl.message(
      'Warehouse',
      name: 'warehouses',
      desc: '',
      args: [],
    );
  }

  /// `Subcontract`
  String get subcontract {
    return Intl.message(
      'Subcontract',
      name: 'subcontract',
      desc: '',
      args: [],
    );
  }

  /// `Subcontract Services`
  String get subcontractService {
    return Intl.message(
      'Subcontract Services',
      name: 'subcontractService',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Supplier`
  String get suppliers {
    return Intl.message(
      'Supplier',
      name: 'suppliers',
      desc: '',
      args: [],
    );
  }

  /// `Travels`
  String get travels {
    return Intl.message(
      'Travels',
      name: 'travels',
      desc: '',
      args: [],
    );
  }

  /// `Units`
  String get units {
    return Intl.message(
      'Units',
      name: 'units',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get view {
    return Intl.message(
      'View all',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get add {
    return Intl.message(
      'Add new',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Item added successfully`
  String get addedSuccessfully {
    return Intl.message(
      'Item added successfully',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Description: `
  String get description {
    return Intl.message(
      'Description: ',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Air Waybill Type`
  String get airwaybillType {
    return Intl.message(
      'Air Waybill Type',
      name: 'airwaybillType',
      desc: '',
      args: [],
    );
  }

  /// `LCL`
  String get LCL {
    return Intl.message(
      'LCL',
      name: 'LCL',
      desc: '',
      args: [],
    );
  }

  /// `FCL`
  String get FCL {
    return Intl.message(
      'FCL',
      name: 'FCL',
      desc: '',
      args: [],
    );
  }

  /// `Air Waybill Number`
  String get airwaybillNumber {
    return Intl.message(
      'Air Waybill Number',
      name: 'airwaybillNumber',
      desc: '',
      args: [],
    );
  }

  /// `number`
  String get number {
    return Intl.message(
      'number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Provided by`
  String get provided {
    return Intl.message(
      'Provided by',
      name: 'provided',
      desc: '',
      args: [],
    );
  }

  /// `Consignee`
  String get consignee {
    return Intl.message(
      'Consignee',
      name: 'consignee',
      desc: '',
      args: [],
    );
  }

  /// `Shipper`
  String get shipper {
    return Intl.message(
      'Shipper',
      name: 'shipper',
      desc: '',
      args: [],
    );
  }

  /// `Carrier`
  String get carrier {
    return Intl.message(
      'Carrier',
      name: 'carrier',
      desc: '',
      args: [],
    );
  }

  /// `Specification`
  String get specification {
    return Intl.message(
      'Specification',
      name: 'specification',
      desc: '',
      args: [],
    );
  }

  /// `choose`
  String get choose {
    return Intl.message(
      'choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Container Type`
  String get containerType {
    return Intl.message(
      'Container Type',
      name: 'containerType',
      desc: '',
      args: [],
    );
  }

  /// `Container Number`
  String get containerNumber {
    return Intl.message(
      'Container Number',
      name: 'containerNumber',
      desc: '',
      args: [],
    );
  }

  /// `Total Cost: `
  String get totalCost {
    return Intl.message(
      'Total Cost: ',
      name: 'totalCost',
      desc: '',
      args: [],
    );
  }

  /// `Nothing Added`
  String get nothingAdded {
    return Intl.message(
      'Nothing Added',
      name: 'nothingAdded',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded`
  String get uploaded {
    return Intl.message(
      'Uploaded',
      name: 'uploaded',
      desc: '',
      args: [],
    );
  }

  /// `Cleared`
  String get cleared {
    return Intl.message(
      'Cleared',
      name: 'cleared',
      desc: '',
      args: [],
    );
  }

  /// `Arrived`
  String get arrived {
    return Intl.message(
      'Arrived',
      name: 'arrived',
      desc: '',
      args: [],
    );
  }

  /// `Air Waybill Information`
  String get airwaybillInformation {
    return Intl.message(
      'Air Waybill Information',
      name: 'airwaybillInformation',
      desc: '',
      args: [],
    );
  }

  /// `Container Information`
  String get containerInformation {
    return Intl.message(
      'Container Information',
      name: 'containerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Requested by: `
  String get RequestedBy {
    return Intl.message(
      'Requested by: ',
      name: 'RequestedBy',
      desc: '',
      args: [],
    );
  }

  /// `Requested at: `
  String get RequestedAt {
    return Intl.message(
      'Requested at: ',
      name: 'RequestedAt',
      desc: '',
      args: [],
    );
  }

  /// `Shipment Information`
  String get shipmentInformation {
    return Intl.message(
      'Shipment Information',
      name: 'shipmentInformation',
      desc: '',
      args: [],
    );
  }

  /// `No shipment has been added`
  String get noShipmentAdd {
    return Intl.message(
      'No shipment has been added',
      name: 'noShipmentAdd',
      desc: '',
      args: [],
    );
  }

  /// `Not full yet`
  String get notFull {
    return Intl.message(
      'Not full yet',
      name: 'notFull',
      desc: '',
      args: [],
    );
  }

  /// `Full`
  String get full {
    return Intl.message(
      'Full',
      name: 'full',
      desc: '',
      args: [],
    );
  }

  /// `You still have some space`
  String get haveSpace {
    return Intl.message(
      'You still have some space',
      name: 'haveSpace',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any space`
  String get noSpace {
    return Intl.message(
      'You don\'t have any space',
      name: 'noSpace',
      desc: '',
      args: [],
    );
  }

  /// `Track Number: `
  String get trackNumber {
    return Intl.message(
      'Track Number: ',
      name: 'trackNumber',
      desc: '',
      args: [],
    );
  }

  /// `Weight: `
  String get weight {
    return Intl.message(
      'Weight: ',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Product Category: `
  String get productCategory {
    return Intl.message(
      'Product Category: ',
      name: 'productCategory',
      desc: '',
      args: [],
    );
  }

  /// `Target Warehouse : `
  String get targetWarehouse {
    return Intl.message(
      'Target Warehouse : ',
      name: 'targetWarehouse',
      desc: '',
      args: [],
    );
  }

  /// `Export Warehouse : `
  String get exportWarehouse {
    return Intl.message(
      'Export Warehouse : ',
      name: 'exportWarehouse',
      desc: '',
      args: [],
    );
  }

  /// `Air Waybill Status`
  String get airwaybillStatus {
    return Intl.message(
      'Air Waybill Status',
      name: 'airwaybillStatus',
      desc: '',
      args: [],
    );
  }

  /// `Container Status`
  String get containerStatus {
    return Intl.message(
      'Container Status',
      name: 'containerStatus',
      desc: '',
      args: [],
    );
  }

  /// `Next Status`
  String get nextStatus {
    return Intl.message(
      'Next Status',
      name: 'nextStatus',
      desc: '',
      args: [],
    );
  }

  /// `You cannot change the state, the container is not full`
  String get noChangeStatus {
    return Intl.message(
      'You cannot change the state, the container is not full',
      name: 'noChangeStatus',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Created At: `
  String get createdAt {
    return Intl.message(
      'Created At: ',
      name: 'createdAt',
      desc: '',
      args: [],
    );
  }

  /// `Updated At: `
  String get updatedAt {
    return Intl.message(
      'Updated At: ',
      name: 'updatedAt',
      desc: '',
      args: [],
    );
  }

  /// `Created By: `
  String get createdBy {
    return Intl.message(
      'Created By: ',
      name: 'createdBy',
      desc: '',
      args: [],
    );
  }

  /// `Updated By: `
  String get updatedBy {
    return Intl.message(
      'Updated By: ',
      name: 'updatedBy',
      desc: '',
      args: [],
    );
  }

  /// `Stage Cost: `
  String get stageCost {
    return Intl.message(
      'Stage Cost: ',
      name: 'stageCost',
      desc: '',
      args: [],
    );
  }

  /// `Filter By`
  String get filterBy {
    return Intl.message(
      'Filter By',
      name: 'filterBy',
      desc: '',
      args: [],
    );
  }

  /// `Air Waybill Finances`
  String get airwaybillFinance {
    return Intl.message(
      'Air Waybill Finances',
      name: 'airwaybillFinance',
      desc: '',
      args: [],
    );
  }

  /// `Container Finances`
  String get containerFinance {
    return Intl.message(
      'Container Finances',
      name: 'containerFinance',
      desc: '',
      args: [],
    );
  }

  /// `Air Waybills`
  String get airWaybills {
    return Intl.message(
      'Air Waybills',
      name: 'airWaybills',
      desc: '',
      args: [],
    );
  }

  /// `Containers`
  String get containers {
    return Intl.message(
      'Containers',
      name: 'containers',
      desc: '',
      args: [],
    );
  }

  /// `Shipment Review`
  String get shipmentReview {
    return Intl.message(
      'Shipment Review',
      name: 'shipmentReview',
      desc: '',
      args: [],
    );
  }

  /// `Supplier Info: `
  String get supplierInfo {
    return Intl.message(
      'Supplier Info: ',
      name: 'supplierInfo',
      desc: '',
      args: [],
    );
  }

  /// `Receiver Info: `
  String get receiverInfo {
    return Intl.message(
      'Receiver Info: ',
      name: 'receiverInfo',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get name {
    return Intl.message(
      'Name: ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Unit: `
  String get unit {
    return Intl.message(
      'Unit: ',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `Mark: `
  String get mark {
    return Intl.message(
      'Mark: ',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  /// `Payment time: `
  String get paymentTime {
    return Intl.message(
      'Payment time: ',
      name: 'paymentTime',
      desc: '',
      args: [],
    );
  }

  /// `Extra specification: `
  String get extraSpecification {
    return Intl.message(
      'Extra specification: ',
      name: 'extraSpecification',
      desc: '',
      args: [],
    );
  }

  /// `Container Specification`
  String get containerSpecification {
    return Intl.message(
      'Container Specification',
      name: 'containerSpecification',
      desc: '',
      args: [],
    );
  }

  /// `Air waybill Specification`
  String get airwaybillSpecification {
    return Intl.message(
      'Air waybill Specification',
      name: 'airwaybillSpecification',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get width {
    return Intl.message(
      'Weight',
      name: 'width',
      desc: '',
      args: [],
    );
  }

  /// `Capacity CPM: `
  String get capacityCPM {
    return Intl.message(
      'Capacity CPM: ',
      name: 'capacityCPM',
      desc: '',
      args: [],
    );
  }

  /// `Length In Meter: `
  String get lengthInMeter {
    return Intl.message(
      'Length In Meter: ',
      name: 'lengthInMeter',
      desc: '',
      args: [],
    );
  }

  /// `Height In Meter: `
  String get heightInMeter {
    return Intl.message(
      'Height In Meter: ',
      name: 'heightInMeter',
      desc: '',
      args: [],
    );
  }

  /// `Width In Meter: `
  String get widthInMeter {
    return Intl.message(
      'Width In Meter: ',
      name: 'widthInMeter',
      desc: '',
      args: [],
    );
  }

  /// `Calling code: `
  String get callingCode {
    return Intl.message(
      'Calling code: ',
      name: 'callingCode',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Country Type: `
  String get countryType {
    return Intl.message(
      'Country Type: ',
      name: 'countryType',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Clients`
  String get clients {
    return Intl.message(
      'Clients',
      name: 'clients',
      desc: '',
      args: [],
    );
  }

  /// `Client: `
  String get client {
    return Intl.message(
      'Client: ',
      name: 'client',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category`
  String get subCategory {
    return Intl.message(
      'Sub Category',
      name: 'subCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Shipment add successfully`
  String get shipmentAddSuccessfully {
    return Intl.message(
      'Shipment add successfully',
      name: 'shipmentAddSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `External Warehouse: `
  String get externalWarehouse {
    return Intl.message(
      'External Warehouse: ',
      name: 'externalWarehouse',
      desc: '',
      args: [],
    );
  }

  /// `True`
  String get truee {
    return Intl.message(
      'True',
      name: 'truee',
      desc: '',
      args: [],
    );
  }

  /// `False`
  String get falsee {
    return Intl.message(
      'False',
      name: 'falsee',
      desc: '',
      args: [],
    );
  }

  /// `Warehouse Info: `
  String get warehouseInfo {
    return Intl.message(
      'Warehouse Info: ',
      name: 'warehouseInfo',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Distributor`
  String get distributor {
    return Intl.message(
      'Distributor',
      name: 'distributor',
      desc: '',
      args: [],
    );
  }

  /// `Container / Air waybill Type`
  String get holderType {
    return Intl.message(
      'Container / Air waybill Type',
      name: 'holderType',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle identification number (if vehicle)`
  String get vehicleNumber {
    return Intl.message(
      'Vehicle identification number (if vehicle)',
      name: 'vehicleNumber',
      desc: '',
      args: [],
    );
  }

  /// `Accepted Shipment`
  String get acceptedShipment {
    return Intl.message(
      'Accepted Shipment',
      name: 'acceptedShipment',
      desc: '',
      args: [],
    );
  }

  /// `Shipment Status`
  String get shipmentStatus {
    return Intl.message(
      'Shipment Status',
      name: 'shipmentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Shipment Finance`
  String get shipmentFinance {
    return Intl.message(
      'Shipment Finance',
      name: 'shipmentFinance',
      desc: '',
      args: [],
    );
  }

  /// `Show Finance`
  String get showFinance {
    return Intl.message(
      'Show Finance',
      name: 'showFinance',
      desc: '',
      args: [],
    );
  }

  /// `Measured`
  String get measured {
    return Intl.message(
      'Measured',
      name: 'measured',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message(
      'Received',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Waiting Shipment`
  String get waitingShipment {
    return Intl.message(
      'Waiting Shipment',
      name: 'waitingShipment',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `accept`
  String get accept {
    return Intl.message(
      'accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Service Name: `
  String get serviceName {
    return Intl.message(
      'Service Name: ',
      name: 'serviceName',
      desc: '',
      args: [],
    );
  }

  /// `Travel Finance`
  String get travelFinance {
    return Intl.message(
      'Travel Finance',
      name: 'travelFinance',
      desc: '',
      args: [],
    );
  }

  /// `Travel Number`
  String get travelNumber {
    return Intl.message(
      'Travel Number',
      name: 'travelNumber',
      desc: '',
      args: [],
    );
  }

  /// `Launch Country`
  String get launchCountry {
    return Intl.message(
      'Launch Country',
      name: 'launchCountry',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get startTime {
    return Intl.message(
      'Start Time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `Destination Country`
  String get destinationCountry {
    return Intl.message(
      'Destination Country',
      name: 'destinationCountry',
      desc: '',
      args: [],
    );
  }

  /// `Arrival Date`
  String get arrivalDate {
    return Intl.message(
      'Arrival Date',
      name: 'arrivalDate',
      desc: '',
      args: [],
    );
  }

  /// `Arrival Time`
  String get arrivalTime {
    return Intl.message(
      'Arrival Time',
      name: 'arrivalTime',
      desc: '',
      args: [],
    );
  }

  /// `There is problem with your connection , please try again`
  String get networkError {
    return Intl.message(
      'There is problem with your connection , please try again',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Wrong username or password`
  String get invalidCredentials {
    return Intl.message(
      'Wrong username or password',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Data fetched succesfuly`
  String get statusCodeOk {
    return Intl.message(
      'Data fetched succesfuly',
      name: 'statusCodeOk',
      desc: '',
      args: [],
    );
  }

  /// `The request has succeeded and a new resource has been created as a result`
  String get statusCodeCreated {
    return Intl.message(
      'The request has succeeded and a new resource has been created as a result',
      name: 'statusCodeCreated',
      desc: '',
      args: [],
    );
  }

  /// `The server could not understand the request due to invalid syntax`
  String get statusCodeBadRequest {
    return Intl.message(
      'The server could not understand the request due to invalid syntax',
      name: 'statusCodeBadRequest',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get statusCodeUnauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'statusCodeUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Data not found`
  String get StatusCodeNotFound {
    return Intl.message(
      'Data not found',
      name: 'StatusCodeNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internalServerError {
    return Intl.message(
      'Internal server error',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Error with Decoding Data`
  String get dataDecodeError {
    return Intl.message(
      'Error with Decoding Data',
      name: 'dataDecodeError',
      desc: '',
      args: [],
    );
  }

  /// `Error Happened`
  String get errorHappened {
    return Intl.message(
      'Error Happened',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been registered successfully`
  String get registerSuccess {
    return Intl.message(
      'Your account has been registered successfully',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `In External Warehouse`
  String get inExternalWarehouse {
    return Intl.message(
      'In External Warehouse',
      name: 'inExternalWarehouse',
      desc: '',
      args: [],
    );
  }

  /// `In Local Warehouse`
  String get inLocalWarehouse {
    return Intl.message(
      'In Local Warehouse',
      name: 'inLocalWarehouse',
      desc: '',
      args: [],
    );
  }

  /// `Air shipment`
  String get airShipment {
    return Intl.message(
      'Air shipment',
      name: 'airShipment',
      desc: '',
      args: [],
    );
  }

  /// `Sea shipment`
  String get seaShipment {
    return Intl.message(
      'Sea shipment',
      name: 'seaShipment',
      desc: '',
      args: [],
    );
  }

  /// `Air travel`
  String get airTravel {
    return Intl.message(
      'Air travel',
      name: 'airTravel',
      desc: '',
      args: [],
    );
  }

  /// `Sea travel`
  String get seaTravel {
    return Intl.message(
      'Sea travel',
      name: 'seaTravel',
      desc: '',
      args: [],
    );
  }

  /// `Extensional Info`
  String get extensionalInfo {
    return Intl.message(
      'Extensional Info',
      name: 'extensionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Other Data`
  String get otherData {
    return Intl.message(
      'Other Data',
      name: 'otherData',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `Started`
  String get started {
    return Intl.message(
      'Started',
      name: 'started',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get currentt {
    return Intl.message(
      'Current',
      name: 'currentt',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Basic Info`
  String get basicInfo {
    return Intl.message(
      'Basic Info',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Enter the track number`
  String get enterNumber {
    return Intl.message(
      'Enter the track number',
      name: 'enterNumber',
      desc: '',
      args: [],
    );
  }

  /// `Company / Personal Name`
  String get companyOrPersonalName {
    return Intl.message(
      'Company / Personal Name',
      name: 'companyOrPersonalName',
      desc: '',
      args: [],
    );
  }

  /// `Status changed by: `
  String get modifiedBy {
    return Intl.message(
      'Status changed by: ',
      name: 'modifiedBy',
      desc: '',
      args: [],
    );
  }

  /// `Arrived Shipment`
  String get arrivedShipment {
    return Intl.message(
      'Arrived Shipment',
      name: 'arrivedShipment',
      desc: '',
      args: [],
    );
  }

  /// `Free Capacity`
  String get freeCapacity {
    return Intl.message(
      'Free Capacity',
      name: 'freeCapacity',
      desc: '',
      args: [],
    );
  }

  /// `Free Weight`
  String get freeWeight {
    return Intl.message(
      'Free Weight',
      name: 'freeWeight',
      desc: '',
      args: [],
    );
  }

  /// `Shipment Cost`
  String get shipmentCost {
    return Intl.message(
      'Shipment Cost',
      name: 'shipmentCost',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get receiver {
    return Intl.message(
      'Receiver',
      name: 'receiver',
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
