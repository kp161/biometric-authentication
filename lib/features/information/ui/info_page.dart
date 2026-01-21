import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:biometric_login/features/information/widgets/build_tip_card.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.bgColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/plants.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Master Plant Care 🌿",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D5A27),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Expert tips to keep your green friends thriving',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    BuildTipCard(
                      icon: Icons.water_drop,
                      title: 'The Finger Test',
                      desc:
                          "Don't water on a schedule. Stick your finger 2 inches into the soil; if it's dry, it's time to water. Overwatering is the #1 killer of houseplants.",
                      color: Colors.blue[50]!,
                      iconColor: Colors.blue,
                    ),
                    BuildTipCard(
                      icon: Icons.wb_sunny,
                      title: 'Light is Food',
                      desc:
                          "Don't water on a schedule. Stick your finger 2 inches into the soil; if it's dry, it's time to water. Overwatering is the #1 killer of houseplants.",
                      color: Colors.orange[50]!,
                      iconColor: Colors.orange,
                    ),
                    BuildTipCard(
                      icon: Icons.air,
                      title: "Humidify",
                      desc:
                          "Tropical plants love humidity. Mist their leaves or place a pebble tray with water nearby to mimic their natural jungle habitat.",
                      color: Colors.cyan[50]!,
                      iconColor: Colors.cyan,
                    ),
                    BuildTipCard(
                      icon: Icons.cleaning_services,
                      title: 'Dusting Leaves',
                      desc:
                          "Dust blocks sunlight. Wipe leaves with a damp cloth every month so the plant can photosynthesize efficientaly.",
                      color: Colors.green[50]!,
                      iconColor: Colors.green,
                    ),
                    BuildTipCard(
                      icon: Icons.restart_alt,
                      title: 'Rotate for Balance',
                      desc:
                          "Plants grow toward the light. Rotate your pot 90 degrees every week to ensure your plant grows straight and even.",
                      color: Colors.purple[50]!,
                      iconColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
