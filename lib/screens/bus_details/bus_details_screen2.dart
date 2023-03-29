import 'package:flutter/material.dart';

import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';

class BusDetailsScreen2 extends StatelessWidget {
  const BusDetailsScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KSRTC Swift Scania P-series'),
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
                  const SizedBox(
                    width: 100,
                    child: Image(
                      image: AssetImage('assets/images/driver.png'),
                    ),
                  )
                ],
              ),
            ),
            KSizedBox.kheight20,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.greyColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Image(
                    image: AssetImage('assets/images/Seat black.png'),
                  ),
                  KSizedBox.kheight10,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Image.asset('assets/images/Seat red.png'),
                          const Spacer(),
                          Image.asset('assets/images/Seat red.png'),
                          KSizedBox.kwidth10,
                          Image.asset('assets/images/Seat red.png'),
                          KSizedBox.kwidth10,
                          Image.asset('assets/images/Seat red.png'),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return KSizedBox.kheight20;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
