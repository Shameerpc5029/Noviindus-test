import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/screens/home/home_screen.dart';
import 'package:moovbe_bus/screens/widgets/custom_textbutton.dart';
import 'package:moovbe_bus/screens/widgets/textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenSize.size.height * .4,
              width: double.infinity,
              color: AppColor.themSecondaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenSize.size.height * .25,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 41,
                        color: AppColor.white,
                      ),
                    ),
                    Text(
                      "Manage your Bus and Drivers",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.white,
                          ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TextFormfieldWidegt(
                    hintText: 'Enter Username',
                    inputType: TextInputType.emailAddress,
                  ),
                  KSizedBox.kheight20,
                  const TextFormfieldWidegt(
                    hintText: 'Enter Password',
                    inputType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: CustomTextButton(
          backgroundColor: AppColor.themePimaryColor,
          foregroundColor: AppColor.white,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ), (route) => false);
          },
          text: 'Login',
        ),
      ),
    );
  }
}
