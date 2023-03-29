import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';

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
          SizedBox(
            height: 58,
            width: MediaQuery.of(context).size.width * .8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: AppColor.themePimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          KSizedBox.kheight20
        ],
      ),
    );
  }
}
