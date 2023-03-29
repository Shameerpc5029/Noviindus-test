import 'package:flutter/material.dart';

import 'package:moovbe_bus/common/colors.dart';

class BusDetailsScreen extends StatelessWidget {
  const BusDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KSRTC Switch Scania'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.themSecondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rohith Sharma",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: AppColor.white,
                        ),
                      ),
                      Text(
                        "License no : PJIIDUDUB776",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                  const Image(image: AssetImage('assets/images/driver.png'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
