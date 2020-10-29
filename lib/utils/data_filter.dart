import 'package:intl/intl.dart';

class DataFilter {
  static int currentValue = 0;

  static List<List<num>> filteredData = [];
  static filterData(List<List<num>> data, List<num> singleData) {
    // currentValue = data[0];

    for (var item in data) {
      if (item[0] - currentValue > 100) {
        // print("current value: $currentValue");
        currentValue = item[0];

        filteredData.add(item);
      }

      // if (data.indexOf(item) == data.length - 1) {
      //   currentValue = 0;
      // }
    }

    print(data.length);

    print(filteredData.length);
    return filteredData;
  }

  static String parseDate(int time) {
    var parsed = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    var formatted = DateFormat().add_jm().format(parsed).toString();

    if (formatted.contains("AM")) {
      formatted = formatted.split("AM").first.trim();
    } else {
      formatted = formatted.split("PM").first.trim();
    }

    return formatted;
  }
}
