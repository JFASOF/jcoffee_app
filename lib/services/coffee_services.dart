import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/coffee_model.dart';

class CoffeeService {
  Future<List<JCoffeeModel>> getCoffees() async {
    try {
      String coffees = await rootBundle.loadString("lib/assets/json/jcoffees.json");

      List<JCoffeeModel> query = (jsonDecode(coffees) as List)
          .map((e) => JCoffeeModel.fromJson(e))
          .toList();
      print(query.length);
      return query;
    } catch (e) {
      return [];
    }
  }
}