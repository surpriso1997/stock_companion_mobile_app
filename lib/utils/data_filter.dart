import 'package:intl/intl.dart';
import 'package:stock_companion/widgets/index_graph.dart';

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

  static String parseDate(int time, {DurationType durationType}) {
    var parsed = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    if (durationType == DurationType.DAY) {
      var formatted = DateFormat().add_jm().format(parsed).toString();

      if (formatted.contains("AM")) {
        formatted = formatted.split("AM").first.trim();
      } else {
        formatted = formatted.split("PM").first.trim();
      }

      return formatted;
    } else if (durationType == DurationType.WEEK) {
      var formatted = DateFormat("EEE MMM dd").format(parsed).toString();

      var split = formatted.split(" ");

      formatted = "${split[1]} ${split[2]}\n${split[0]}";
      return formatted;
    } else if (durationType == DurationType.MONTH) {
      var formatted = DateFormat("MMM dd").format(parsed).toString();

      return formatted;
    } else if (durationType == DurationType.YEAR) {
      var formatted = DateFormat("dd MMM").format(parsed).toString();

      return formatted;
    } else if (durationType == DurationType.MAX) {
      var formatted = DateFormat("MMM yyy").format(parsed).toString();

      var split = formatted.split(" ");

      return split.first + "\n" + split.last;
    }

    // var formatted = DateFormat().add_jm().format(parsed).toString();
  }
}
