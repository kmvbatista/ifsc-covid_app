import 'package:covid_app/components/Select.dart';
import 'package:covid_app/models/CountryTotalCases.dart';
import 'package:covid_app/models/SelectCountry.dart';
import 'package:covid_app/models/SelectedCountry.dart';
import 'package:covid_app/pages/home/tabs/CountriesTable.dart';
import 'package:covid_app/pages/home/tabs/Panel.dart';
import 'package:covid_app/repository.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  Repository repository = Repository();
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<SelectCountry> selectData = [];
  List<CountryTotalCases> tableData = [];
  SelectedCountry selectedCountry = SelectedCountry("", "", "", "", "", "", "");

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    getCountriesData();
    getCountryData("worldwide");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCountry.name ?? "Mundo"),
        actions: [Select(getCountryData, selectData)],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "Painel",
            ),
            Tab(text: "Casos por país")
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [Panel(selectedCountry), CountriesTable(tableData)],
      ),
    );
  }

  Future getCountryData(String countryCode) async {
    var countryJson =
        await widget.repository.getCountryData(countryCode: countryCode);
    setState(() {
      selectedCountry = SelectedCountry.fromJson(countryJson);
    });
  }

  Future getCountriesData() async {
    var countries = await widget.repository.getCountriesData();
    setState(() {
      tableData = getCountriesTotalCasesFromJson(countries);
      selectData = getSelectData(countries);
    });
  }

  List<CountryTotalCases> getCountriesTotalCasesFromJson(countriesJson) {
    List<CountryTotalCases> countries = countriesJson
        .map<CountryTotalCases>(
            (countryJson) => CountryTotalCases.fromJson(countryJson))
        .toList();
    countries.sort(
      (a, b) => a.totalCases.compareTo(b.totalCases),
    );
    return countries.reversed.toList();
  }

  List<SelectCountry> getSelectData(countriesJson) => countriesJson
      .map<SelectCountry>((countryJson) => SelectCountry(
          countryJson['countryInfo']['iso2'], countryJson['country']))
      .toList();
}
