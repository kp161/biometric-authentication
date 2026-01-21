import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:biometric_login/features/plants/ui/all_plant_page.dart';
import 'package:biometric_login/features/information/ui/info_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    AllPlantPage(),
    InfoPage(),
    //second page
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildItems(Icons.local_florist_outlined, 'My Plants', 0),
            _buildItems(Icons.info_outline, 'Info Page', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildItems(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white24 : Colors.transparent,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
