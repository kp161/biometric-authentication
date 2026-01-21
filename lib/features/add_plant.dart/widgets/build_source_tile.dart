import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:biometric_login/core/constants/app_colors.dart';

class BuildSourceTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final ImageSource source;
  final VoidCallback onTap;

  const BuildSourceTile({
    super.key,
    required this.icon,
    required this.label,
    required this.source,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primaryColor.withOpacity(0.1),
        child: Icon(icon, color: AppColors.primaryColor),
      ),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }
}
