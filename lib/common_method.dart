import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groceries_shopping_app/app_preferences.dart';
import 'package:groceries_shopping_app/screens/login_screen.dart';
import 'package:intl/intl.dart';

class CommonMethod {
  static String AUDIO = "audio";
  static String MEDIA = "media";
  static String TEXT = "text";
  static String DATE_FORMAT = 'dd-MMMM-yyyy';
  static String DATE_FORMATDISPLAY = '"dd MMMM yyyy"';

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
    );
  }

  static String getMinDate() {
    var currentDate = new DateTime.now();
    DateTime min_date = new DateTime(currentDate.year - 120);
    return CommonMethod.getFormattedDate("yyyy-MM-dd", min_date);
  }

  static String getMaxDate() {
    var currentDate = new DateTime.now();
    DateTime max_date = new DateTime(currentDate.year - 13);
    return CommonMethod.getFormattedDate("yyyy-MM-dd", max_date);
  }

  static String getFormattedDate(String pattern, DateTime selectedDate) {
    //'EEE MMM d yyyy'
    final DateFormat formatter = DateFormat(pattern);
    final String formattedDate = formatter.format(selectedDate);
    return '${formattedDate}';
  }

  static logout(BuildContext context) {
    AppPreferences _appPreferences = AppPreferences();
    _appPreferences.setLoggedIn(isLoggedIn: false);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginScreen()), (r) => false);
  }

  static shareDialog(String text) {
    // Share.share('' + text, subject: '');
  }

  static bool isValidDate(String selectedDate) {
    try {
      RegExp exp = new RegExp(r"\d{2}-\d{2}-\d{4}");
      Iterable<RegExpMatch> matches = exp.allMatches(selectedDate);

      if (matches.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("===e=========${e}=======");
      return false;
    }

    print("===str=========${selectedDate}=======");
  }

  static bool isValidDate1(String input) {
    try {
      final date = DateTime.parse(input);
      final originalFormatString = toOriginalFormatString(date);
      return input == originalFormatString;
    } catch (e) {
      return false;
    }
  }

  static String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$y$m$d";
  }

  static DateTime getDateTimeMin() {
    var currentDate = new DateTime.now();
    DateTime min_date = new DateTime(currentDate.year - 120);
    return min_date;
  }

  String getFormattedTime(TimeOfDay selectedTime) {
    final String formattedTime = '${selectedTime.hour}:${selectedTime.minute}';
    return '${formattedTime}';
  }
}
// String strFormattedPickedDate =
// commanMethod.getFormattedDate('EEE MMM d yyyy', pickedDate);
