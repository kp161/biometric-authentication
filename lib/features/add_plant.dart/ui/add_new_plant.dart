import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:biometric_login/features/add_plant.dart/ui/add_new_plant_controller.dart';
import 'package:biometric_login/features/add_plant.dart/widgets/plant_form.dart';
import 'package:biometric_login/features/add_plant.dart/widgets/plant_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewPlant extends StatelessWidget {
  const AddNewPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddNewPlantController(),
      child: const _AddNewPlantView(),
    );
  }
}

class _AddNewPlantView extends StatelessWidget {
  const _AddNewPlantView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddNewPlantController>();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text(
          'Add New Plant',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),
                PlantImagePicker(
                  image: controller.image,
                  onpick: controller.pickImage,
                ),
                const SizedBox(height: 50),
                PlantForm(
                  controller: controller.nameController,
                  status: controller.selectedStatus,
                  onStatusChanged: controller.setStatus,
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<AddNewPlantController>().savePlants(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              backgroundColor: AppColors.buttonBgColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Text(
              "Add to Collections",
              style: TextStyle(
                color: AppColors.buttonTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
