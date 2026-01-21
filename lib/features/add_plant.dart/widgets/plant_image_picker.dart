import 'dart:io';

import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:biometric_login/features/add_plant.dart/widgets/build_source_tile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PlantImagePicker extends StatelessWidget {
  final File? image;
  final Function(ImageSource) onpick;

  const PlantImagePicker({
    super.key,
    required this.image,
    required this.onpick,
  });

  void _showSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Select Image Source',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          BuildSourceTile(
            icon: Icons.camera_alt,
            label: 'Camera',
            source: ImageSource.camera,
            onTap: () {
              Navigator.pop(context);
              onpick(ImageSource.camera);
            },
          ),
          BuildSourceTile(
            icon: Icons.photo_library,
            label: 'Gallery',
            source: ImageSource.gallery,
            onTap: () {
              Navigator.pop(context);
              onpick(ImageSource.gallery);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _showSourceSheet(context),
        child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: AppColors.splashColor2.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 4),
              )
            ],
            image: image != null
                ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
                : null,
          ),
          child: image == null
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.local_florist_outlined,
                      size: 42,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Add Plant Image',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                ],
              )
              : null,
        ),
      ),
    );
  }
}
