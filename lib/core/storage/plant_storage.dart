import 'dart:convert';

import 'package:biometric_login/features/add_plant.dart/model/plant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantStorage {
  static const _key = 'plants';

  static Future<void> savePlant(List<Plant> plant) async {
    final prefs = await SharedPreferences.getInstance();

    final plantJsonList = plant
        .map((plant) => jsonEncode(plant.toJson()))
        .toList();

    await prefs.setStringList(_key, plantJsonList);
  }

  static Future<List<Plant>> loadPlants() async {
    final prefs = await SharedPreferences.getInstance();

    final plantJsonList = prefs.getStringList(_key) ?? [];

    return plantJsonList
        .map((json) => Plant.fromJson(jsonDecode(json)))
        .toList();
  }

  static Future<void> clearPlants() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
