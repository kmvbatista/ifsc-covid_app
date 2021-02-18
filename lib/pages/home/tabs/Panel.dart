import 'package:covid_app/components/InfoCard.dart';
import 'package:covid_app/models/SelectedCountry.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  SelectedCountry selectedCountry;
  Panel(this.selectedCountry);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoCard(
            mainText: selectedCountry.todayCases,
            title: "Casos de",
            secondaryText: selectedCountry.totalCases,
          ),
          InfoCard(
            isPositive: true,
            mainText: selectedCountry.todayRecovered,
            title: "Recuperados de",
            secondaryText: selectedCountry.totalRecovered,
          ),
          InfoCard(
            mainText: selectedCountry.todayDeaths,
            title: "Mortes de",
            secondaryText: selectedCountry.totalDeaths,
          )
        ],
      ),
    );
  }
}
