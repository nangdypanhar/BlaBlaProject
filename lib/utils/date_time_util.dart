
import 'package:intl/intl.dart';

////
//// Utility class for formatting DateTime objects into human-readable strings.
////
class DateTimeUtils {
  static String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final timeFormatted = DateFormat('h:mm a').format(dateTime); 

    if (targetDate == today) {
      return 'Today $timeFormatted';
    } else if (targetDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday $timeFormatted';
    } else if (targetDate == today.add(Duration(days: 1))) {
      return 'Tomorrow $timeFormatted';
    } else {
     return '${DateFormat('E d MMM').format(dateTime)} $timeFormatted'; // Example: Wed 12 Feb
    }
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime); // Example: 14:30 (24-hour format)
  }
}
