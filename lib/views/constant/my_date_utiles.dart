import 'package:intl/intl.dart';

class MyDateUtiles {
  static String formatNewsFormat(String inputFormat) {
    var inputFormator = DateFormat('yyyy-MM-ddThh:mm:ssZ');
    var outputFormator = DateFormat('yyyy/MMM/dd hh:mm: a');
    var inputDate = inputFormator.parse(inputFormat);
    var outputDate = outputFormator.format(inputDate);
    return outputDate;
  }
}
