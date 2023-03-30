import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/view/widgets/custom_textbutton.dart';
import 'package:moovbe_bus/view/widgets/textformfield_widget.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Driver',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TextFormfieldWidegt(
              hintText: 'Enter Name',
              inputType: TextInputType.name,
              controller: TextEditingController(),
            ),
            KSizedBox.kheight20,
            TextFormfieldWidegt(
              hintText: 'Enter License Number',
              inputType: TextInputType.name,
              controller: TextEditingController(),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: CustomTextButton(
          backgroundColor: AppColor.themePimaryColor,
          foregroundColor: AppColor.white,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddDriverScreen(),
              ),
            );
          },
          text: 'Save',
        ),
      ),
    );
  }
}
