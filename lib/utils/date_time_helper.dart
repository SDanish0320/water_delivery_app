import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getCurrentDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('MMM dd, yyyy hh:mm a');
    return formatter.format(now);
  }

  static String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMM dd');
    return formatter.format(now);
  }

  static String getCurrentDateLong() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMMM dd');
    return formatter.format(now);
  }

  static String getLastLoginFormat() {
    final now = DateTime.now();
    final formatter = DateFormat('MMM dd, yyyy \'PMT\' hh:mm a');
    return formatter.format(now);
  }
}