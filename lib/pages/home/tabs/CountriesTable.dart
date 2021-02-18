import 'package:covid_app/models/CountryTotalCases.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountriesTable extends StatelessWidget {
  CountriesTable(this.tableData);
  final List<CountryTotalCases> tableData;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tableData
          .map((countryTotalCases) => ListTile(
                trailing: Text(NumberFormat.currency(
                        locale: 'pt-BR', symbol: '', decimalDigits: 0)
                    .format(countryTotalCases.totalCases)),
                title: Text(countryTotalCases.name),
                subtitle: Text(countryTotalCases.continent),
                leading: Container(
                  width: 40,
                  child: Image.network(countryTotalCases.flagUrl ??
                      "https://disease.sh/assets/img/flags/br.png"),
                ),
              ))
          .toList(),
    );
  }
}
