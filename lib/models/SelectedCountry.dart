import 'package:intl/intl.dart';

class SelectedCountry {
  String todayCases;
  String todayDeaths;
  String todayRecovered;
  String totalRecovered;
  String totalDeaths;
  String totalCases;
  String name;

  SelectedCountry(
      this.name,
      this.todayCases,
      this.todayDeaths,
      this.todayRecovered,
      this.totalCases,
      this.totalDeaths,
      this.totalRecovered);

  SelectedCountry.fromJson(Map<String, dynamic> json)
      : name = json['country'],
        todayCases = getFormattedNumber(json['todayCases']),
        totalCases = getFormattedNumber(json['cases']),
        totalRecovered = getFormattedNumber(json['recovered']),
        todayRecovered = getFormattedNumber(json['todayRecovered']),
        todayDeaths = getFormattedNumber(json['todayDeaths']),
        totalDeaths = getFormattedNumber(json['deaths']);

  static String getFormattedNumber(int number) {
    return NumberFormat.currency(locale: 'pt-BR', symbol: '', decimalDigits: 0)
        .format(number);
  }
}
