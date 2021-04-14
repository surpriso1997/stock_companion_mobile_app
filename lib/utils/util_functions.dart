import 'package:intl/intl.dart';
import 'package:stock_companion/utils/utils.dart';

const ARBA = 1000000000;
const KHARBA = 100000000000;
const CRORE = 10000000;
const LAKH = 100000;

processIndexTitle(String title) {
  if (title.contains("Index")) {
    var item = title.split("Index");
    return item.first;
  } else if (title.toLowerCase().contains('manufacturing')) {
    return "Manufac & Pro";
  }
  return title;
}

double getBrokerCommission(double totalAmount) {
  //// Rates:
  /// 1: up to 50,000       : 0.4
  /// 2: 50,000-500,000     : 0.37
  /// 3: 500,000-20 lakhs   : 0.34
  /// 4:20 lakhs-1 crore    : 0.3
  /// 5:Above 1 crore       : 0.27

  const int k50 = 50000;
  const int lakh5 = 500000;
  const int lakh20 = 2000000;
  const int crore1 = 10000000;

  if (totalAmount < k50) {
    return totalAmount * 0.4 / 100;
  } else if (totalAmount >= k50 && totalAmount < lakh5) {
    return totalAmount * 0.37 / 100;
  } else if (totalAmount >= lakh5 && totalAmount < lakh20) {
    return totalAmount * 0.34 / 100;
  } else if (totalAmount >= lakh20 && totalAmount < crore1) {
    return totalAmount * 0.3 / 100;
  }
  {
    return totalAmount * 0.27 / 100;
  }
}

double getSebonCommission(double amount) {
  const double sebonCommission = 0.015;

  return amount * sebonCommission / 100;
}

double getCapitalGainTax(
    double purchaseAmount, double sellAmount, bool isIndividual) {
  if (purchaseAmount >= sellAmount) {
    return 0;
  } else {
    if (isIndividual)
      return (sellAmount - purchaseAmount) *
          Constants.capitalGainIndividual /
          100;
    else {
      return (sellAmount - purchaseAmount) * Constants.capitalGainCompany / 100;
    }
  }
}

int getEpochFromDate(DateTime now, int days) {
  var oldDate = now.subtract(Duration(days: days));
  return oldDate.millisecondsSinceEpoch;
}

/// format date to yyyy-mm-dd format
String formatDate(DateTime date) {
  var format = DateFormat("yyyy-MM-dd");

  return format.format(date);
}

String getArba(double value) {
  return (value / ARBA).toStringAsFixed(3);
}

String getKharba(double value) {
  return (value / KHARBA).toStringAsFixed(3);
}

String getCrore(double value) {
  return (value / CRORE).toStringAsFixed(3);
}

String getLakhs(double value) {
  return (value / LAKH).toStringAsFixed(3);
}
