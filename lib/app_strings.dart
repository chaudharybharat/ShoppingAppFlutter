/// App Strings Class -> Resource class for storing app level strings constants
class AppStrings {
  static const String APP_NAME = "Very";

  //--------------------------------------------------- Login -----------------------------------------------------------------------------------------
  /*Login*/
  static const String SIGN_IN = "Sign In";
  static const String NEW_ACCOUNT = "New Account";
  static const String LOGIN = "Login";
  static const String PASSWORD = "Password";

  static const String SIGN_UP = "Sign Up";
  static const String CREATE_ACCOUNT = "Create Account";
  static const String INVALID_USER_NAME_EMAIL = "Invalid Username or Email";

  /*Select Language*/
  static const String SELECT_YOUR_LANGUAGE = "Select Your Language";
}

enum PrefType {
  PREF_TYPE_BOOL,
  PREF_TYPE_INTEGER,
  PREF_TYPE_DOUBLE,
  PREF_TYPE_STRING,
  PREF_TYPE_OBJECT
}
