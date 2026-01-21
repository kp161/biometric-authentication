import 'dart:io';

import 'package:biometric_login/features/add_plant.dart/model/plant.dart';
import 'package:flutter/material.dart';

class BuildPlantGrid extends StatelessWidget {
  final List<Plant> plants;
  final void Function(int index) onDelete;

  const BuildPlantGrid({
    super.key,
    required this.plants,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.95,
      ),
      itemCount: plants.length,
      itemBuilder: (context, index) {
        final plant = plants[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Positioned(
              //   top: 8,
              //   right: 8,
              //   child: GestureDetector(
              //     onTap: () => onDelete(index),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Colors.red[50],
              //       ),
              //       padding: EdgeInsets.all(4),
              //       child: Icon(Icons.delete, color: Colors.red[400], size: 18),
              //     ),
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(0.1),
                      image: plant.img.startsWith('/')
                          ? DecorationImage(
                              image: FileImage(File(plant.img)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Center(
                      child: !plant.img.startsWith('/')
                          ? Text(plant.img, style: TextStyle(fontSize: 35))
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    plant.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    plant.status,
                    style: TextStyle(
                      color: plant.status == "Thirsty"
                          ? Colors.orange
                          : Colors.green,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
