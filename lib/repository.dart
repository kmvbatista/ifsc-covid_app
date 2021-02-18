import 'package:dio/dio.dart';

class Repository {
  Repository() {
    client = Dio();
  }
  Dio client;

  Future getCountriesData() async {
    var response = await client.get("https://disease.sh/v3/covid-19/countries");
    return response.data;
  }

  Future getCountryData({countryCode = 'worldwide'}) async {
    String uri = countryCode == "worldwide"
        ? "https://disease.sh/v3/covid-19/all"
        : "https://disease.sh/v3/covid-19/countries/" + countryCode;
    var response = await client.get(uri);
    return response.data;
  }
}
