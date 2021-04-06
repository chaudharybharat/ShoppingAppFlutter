import 'dart:convert';

import 'package:groceries_shopping_app/app_strings.dart';
import 'package:groceries_shopping_app/reponse/login_respon_main.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppPreferences {
  //------------------------------------------------------------- Preference Constants ------------------------------------------------------------

  // Constants for Preference-Name
  static const String PREF_IS_LOGGED_IN = "IS_LOGGED_IN";
  static const String IS_REMEMBER_PASSWORD = "IS_REMEMBER_PASSWORD";
  static const String IS_REMEMBER_USERNAME = "IS_REMEMBER_USERNAME";
  static const String PREF_LOGIN_TYPE = "LOGIN_TYPE";
  static const String PREF_DEVICE_TYPE = "DEVICE_TYPE";
  static const String PREF_USER_DETAIL = "user_detail";
  static const String PREF_DEVICE_NAME = "DEVICE_NAME";
  static const String PREF_DEVICE_VERSION = "DEVICE_VERSION";
  static const String PREF_SELECTED_LANGUAGE = "SELECTED_LANGUAGE";

//  static UserModel _userInfo = null;

  //-------------------------------------------------------------------- Variables -------------------------------------------------------------------
  // Future variable to check SharedPreference Instance is ready
  // This is actually a hack. As constructor is not allowed to have 'async' we cant 'await' for future value
  // SharedPreference.getInstance() returns Future<SharedPreference> object and we want to assign its value to our private _preference variable
  // In case if we don't 'await' for SharedPreference.getInstance() method, and in mean time if we access preferences using _preference variable we will get
  // NullPointerException for _preference variable, as it isn't yet initialized.
  // We need to 'await' _isPreferenceReady value for only once when preferences are first time requested in application lifecycle because in further
  // future requests, preference instance is already ready as we are using Singleton-Instance.
  Future _isPreferenceInstanceReady;

  // Private variable for SharedPreferences
  SharedPreferences _preferences;

  //-------------------------------------------------------------------- Singleton ----------------------------------------------------------------------
  // Final static instance of class initialized by private constructor
  static final AppPreferences _instance = AppPreferences._internal();

  // Factory Constructor
  factory AppPreferences() => _instance;

  /// AppPreference Private Internal Constructor -> AppPreference
  /// @param->_
  /// @usage-> Initialize SharedPreference object and notify when operation is complete to future variable.
  AppPreferences._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  //------------------------------------------------------- Getter Methods -----------------------------------------------------------
  // GETTER for isPreferenceReady future
  Future get isPreferenceReady => _isPreferenceInstanceReady;
  void saveUserDetail({@required String userDetail}) => _setPreference(
      prefName: PREF_USER_DETAIL,
      prefValue: userDetail,
      prefType: PrefType.PREF_TYPE_STRING);
  Future<UserDetail> getUserDetail() async {
    var userDetailSting = await _getPreference(prefName: PREF_USER_DETAIL);
    Map userMap = jsonDecode(userDetailSting);
    var user = UserDetail.fromJson(userMap);
    return user;
  }

  //--------------------------------------------------- Public Preference Methods -------------------------------------------------------------
  /// Set Logged-In Method -> void
  /// @param -> @required isLoggedIn -> bool
  /// @usage -> Set value of IS_LOGGED_IN in preferences
  void setLoggedIn({@required bool isLoggedIn}) => _setPreference(
      prefName: PREF_IS_LOGGED_IN,
      prefValue: isLoggedIn,
      prefType: PrefType.PREF_TYPE_BOOL);

  void setRemeberPassword({@required String rememberpassword}) =>
      _setPreference(
          prefName: IS_REMEMBER_PASSWORD,
          prefValue: rememberpassword,
          prefType: PrefType.PREF_TYPE_STRING);
  void setRemeberUserName({@required String username}) => _setPreference(
      prefName: IS_REMEMBER_USERNAME,
      prefValue: username,
      prefType: PrefType.PREF_TYPE_STRING);
  void setLoginType({@required String loginType}) => _setPreference(
      prefName: PREF_LOGIN_TYPE,
      prefValue: loginType,
      prefType: PrefType.PREF_TYPE_STRING);

  void setDeviceType({@required String deviceType}) => _setPreference(
      prefName: PREF_DEVICE_TYPE,
      prefValue: deviceType,
      prefType: PrefType.PREF_TYPE_STRING);

  void setDeviceName({@required String deviceName}) => _setPreference(
      prefName: PREF_DEVICE_NAME,
      prefValue: deviceName,
      prefType: PrefType.PREF_TYPE_STRING);

  void setDeviceOS({@required String deviceOSVersion}) => _setPreference(
      prefName: PREF_DEVICE_VERSION,
      prefValue: deviceOSVersion,
      prefType: PrefType.PREF_TYPE_STRING);

  void setLanguageId({@required String languageId}) => _setPreference(
      prefName: PREF_SELECTED_LANGUAGE,
      prefValue: languageId,
      prefType: PrefType.PREF_TYPE_STRING);

  /// Get Logged-In Method -> Future<bool>
  /// @param -> _
  /// @usage -> Get value of IS_LOGGED_IN from preferences
  Future<bool> getLoggedIn() async =>
      await _getPreference(prefName: PREF_IS_LOGGED_IN) ??
      false; // Check value for NULL. If NULL provide default value as FALSE.

  Future<String> getLoggedType() async {
    var loginType = await _getPreference(prefName: PREF_LOGIN_TYPE);
    return loginType;
  }

  Future<String> getRememberPassword() async {
    var remeberpassword = await _getPreference(prefName: IS_REMEMBER_PASSWORD);
    return remeberpassword;
  }

  Future<String> getRememberUserName() async {
    var remeberUsername = await _getPreference(prefName: IS_REMEMBER_USERNAME);
    return remeberUsername;
  }

  Future<String> getDeviceType() async {
    var deviceType = await _getPreference(prefName: PREF_DEVICE_TYPE);
    return deviceType;
  }

  Future<String> getDeviceName() async {
    var deviceName = await _getPreference(prefName: PREF_DEVICE_NAME);
    return deviceName;
  }

  Future<String> getDeviceOSVersion() async {
    var deviceOSVersion = await _getPreference(prefName: PREF_DEVICE_VERSION);
    return deviceOSVersion;
  }

  Future<String> getLanguageId() async {
    var languageId = await _getPreference(prefName: PREF_SELECTED_LANGUAGE);
    return languageId;
  }

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------
  /// Set Preference Method -> void
  /// @param -> @required prefName -> String
  ///        -> @required prefValue -> dynamic
  ///        -> @required prefType -> String
  /// @usage -> This is a generalized method to set preferences with required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  void _setPreference(
      {@required String prefName,
      @required dynamic prefValue,
      @required PrefType prefType}) {
    // Make switch for Preference Type i.e. Preference-Value's data-type
    switch (prefType) {
      // prefType is bool
      case PrefType.PREF_TYPE_BOOL:
        {
          _preferences.setBool(prefName, prefValue);
          break;
        }
      // prefType is int
      case PrefType.PREF_TYPE_INTEGER:
        {
          _preferences.setInt(prefName, prefValue);
          break;
        }
      // prefType is double
      case PrefType.PREF_TYPE_DOUBLE:
        {
          _preferences.setDouble(prefName, prefValue);
          break;
        }
      // prefType is String
      case PrefType.PREF_TYPE_STRING:
        {
          _preferences.setString(prefName, prefValue);
          break;
        }

      case PrefType.PREF_TYPE_OBJECT:
        {
          _preferences.setString(prefName, jsonEncode(prefValue));
          break;
        }
    }
  }

  /// Get Preference Method -> Future<dynamic>
  /// @param -> @required prefName -> String
  /// @usage -> Returns Preference-Value for given Preference-Name
  Future<dynamic> _getPreference({@required prefName}) async =>
      _preferences.get(prefName);
}
