import 'package:intl/intl.dart';

String formatDate(String? date) {
  DateTime dateTime = DateTime.parse(date!);
  String formattedDate = DateFormat('MMMM d, y').format(dateTime);
  return formattedDate;
}

String formatCurrentDate(DateTime? date,locale) {
  return DateFormat('EEEE, dd-MM-yyyy' , '$locale').format(date!);
}

bool compareDate(date){
  // Parse the string into a DateTime object
  DateTime givenDate = DateTime.parse(date);

  // Zero out the time part by creating a new DateTime with only year, month, and day
  DateTime givenDateOnly = DateTime(givenDate.year, givenDate.month, givenDate.day);

  // Get the current date and zero out the time
  DateTime currentDateOnly = DateTime.now();
  currentDateOnly = DateTime(currentDateOnly.year, currentDateOnly.month, currentDateOnly.day);

  // Calculate the difference
  Duration difference = givenDateOnly.difference(currentDateOnly);

  int? days = difference.inDays;

  return days<=0?false:true;
}

