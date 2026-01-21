import 'package:biometric_login/core/storage/plant_storage.dart';
import 'package:biometric_login/features/add_plant.dart/ui/add_new_plant.dart';
import 'package:biometric_login/features/add_plant.dart/model/plant.dart';
import 'package:biometric_login/features/plants/widgets/build_add_plant_card.dart';
import 'package:biometric_login/features/plants/widgets/build_header.dart';
import 'package:biometric_login/features/plants/widgets/build_plant_grid.dart';
import 'package:flutter/material.dart';

class AllPlantPage extends StatefulWidget {
  const AllPlantPage({super.key});

  @override
  State<AllPlantPage> createState() => _AllPlantPageState();
}

class _AllPlantPageState extends State<AllPlantPage> {
  final List<Plant> staticPlants = [
    Plant(name: "Monstera", status: "Thirsty", img: "🌵"),
    Plant(name: "Snake Plant", status: "Healthy", img: "🐍"),
    Plant(name: "Aloe Vera", status: "Healthy", img: "🪴"),
    Plant(name: "Peace Lily", status: "Low Light", img: "🌸"),
  ];

  List<Plant> plants = [];

  void deletePlant(int index) async {
    setState(() {
      plants.removeAt(index);
    });

    final userPlants = plants.where((p) => !staticPlants.contains(p)).toList();

    await PlantStorage.savePlant(userPlants);
  }

  @override
  void initState() {
    super.initState();
    loadPlants();
  }

  Future<void> loadPlants() async {
    final savedPlants = await PlantStorage.loadPlants();
    setState(() {
      plants = [
        ...staticPlants,
        ...savedPlants,
      ];
    });
  }

  void _navigateAndAddPlant() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewPlant()),
    );

    if (result != null && result is Plant) {
      setState(() {
        plants.add(result);
      });

      final userPlants = plants.where((p) => !staticPlants.contains(p)).toList();

      await PlantStorage.savePlant(userPlants);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              BuildHeader(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _navigateAndAddPlant,
                child: const BuildAddPlantCard(),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Collection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BuildPlantGrid(plants: plants, onDelete: deletePlant),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
