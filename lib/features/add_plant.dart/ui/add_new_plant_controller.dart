import 'dart:io';

import 'package:biometric_login/core/storage/plant_storage.dart';
import 'package:biometric_login/features/add_plant.dart/model/plant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewPlantController extends ChangeNotifier {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String selectedStatus = 'Healthy';
  File? image;

  Future<void> savePlants(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final newPlant = Plant(
      name: nameController.text,
      status: selectedStatus,
      img: image?.path ?? "🌿",
    );
    final plants = await PlantStorage.loadPlants();
    plants.add(newPlant);
    await PlantStorage.savePlant(plants);
    Navigator.pop(context, newPlant);
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  void setStatus(String value) {
    selectedStatus = value;
    notifyListeners();
  }
}
