import 'package:covid_app/models/SelectCountry.dart';
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  Select(this.onChange, this.countries);
  final Function onChange;
  final List<SelectCountry> countries;
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String chosedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Selecione um país"),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      icon: Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      iconSize: 24,
      value: chosedValue,
      onChanged: (String newValue) {
        setState(() {
          chosedValue = newValue;
        });
        widget.onChange(newValue);
      },
      items: widget.countries
          .map((sc) => DropdownMenuItem<String>(
                value: sc.countryCode,
                child: Text(sc.name == "Diamond Princess"
                    ? "Selecione um país"
                    : sc.name),
              ))
          .toList(),
    );
  }
}
