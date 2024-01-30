import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/authentication/controllers/signup_controller.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              child: Text(
                'Gender: ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRadioButton('Male', 'male'),
                _buildRadioButton('Female', 'female'),
                // _buildRadioButton('Other', 'Other'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioButton(String gender, String value) {
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx(
          () => Radio(
            value: value,
            groupValue: controller.selectedGender.value,
            onChanged: (value) => controller.selectedGender.value = value!,
          ),
        ),
        Text(gender),
      ],
    );
  }
}
