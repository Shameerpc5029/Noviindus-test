import 'package:flutter/material.dart';

import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/view/login/login_screen.dart';
import 'package:moovbe_bus/view/widgets/custom_textbutton.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themePimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          CustomTextButton(
            backgroundColor: AppColor.white,
            foregroundColor: AppColor.themePimaryColor,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ), (route) => false);
            },
            text: 'Get Started',
          ),
          KSizedBox.kheight20
        ],
      ),
    );
  }
}
