import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PlantForm extends StatelessWidget {
  final TextEditingController controller;
  final String status;
  final Function(String) onStatusChanged;

  const PlantForm({
    super.key,
    required this.controller,
    required this.status,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your Plant name here...',
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
            labelText: "Plant name",
            labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Plant name is required';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: 30),
        DropdownButtonFormField<String>(
          value: status,
          items: const [
            DropdownMenuItem(value: "Healthy", child: Text("Healthy")),
            DropdownMenuItem(value: "Thirsty", child: Text("Thirsty")),
            DropdownMenuItem(value: "Low Light", child: Text("Low Light")),
          ],
          onChanged: (val) => onStatusChanged(val!),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select Plant status';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: "Status",
            labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ],
    );
  }
}
