import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:packageflutter_2/models/province.dart';
import 'package:packageflutter_2/models/city.dart';

class HomePage extends StatelessWidget {
  String? idProv;
  final String apiKey =
      "9ed7d10421f1cbfd7fcc2e0376b3aeab91d2dbd8d91dc19d36f1377e792f1664";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wilayah Indonesia"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          DropdownSearch<Province>(
              popupProps: PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: false,
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
              ),
              asyncItems: (String filter) async {
                var response = await http.get(
                  Uri.parse(
                      "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"),
                );
                if (response.statusCode != 200) {
                  return [];
                } else {
                  List allProvince = (jsonDecode(response.body)
                      as Map<String, dynamic>)["value"];
                  List<Province> allModelProvicen = [];
                  allProvince.forEach((element) {
                    allModelProvicen.add(
                      Province(
                        id: element["id"],
                        name: element["name"],
                      ),
                    );
                  });
                  return allModelProvicen;
                }
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Menu mode",
                  hintText: "country in menu mode",
                ),
              ),
              onChanged: (value) => idProv = value?.id),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<City>(
            popupProps: PopupProps.dialog(
              showSearchBox: true,
              showSelectedItems: false,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            asyncItems: (String filter) async {
              var response = await http.get(
                Uri.parse(
                    "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"),
              );
              if (response.statusCode != 200) {
                return [];
              } else {
                List allCity = (jsonDecode(response.body)
                    as Map<String, dynamic>)["value"];
                List<City> allModelCity = [];
                allCity.forEach((element) {
                  allModelCity.add(
                    City(
                      id: element["id"],
                      idProvinsi: element["id_provinsi"],
                      name: element["name"],
                    ),
                  );
                });
                return [];
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
            ),
            onChanged: (value) => print(value?.toJson()),
          ),
        ],
      ),
    );
  }
}
