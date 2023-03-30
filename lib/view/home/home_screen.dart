import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/view/bus_details/bus_details_screen.dart';
import 'package:moovbe_bus/view/bus_details/bus_details_screen2.dart';

import 'package:moovbe_bus/view/driver_list/driver_list_screen.dart';
import 'package:moovbe_bus/view/home/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          height: 40,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    title: 'Bus',
                    subTitle: 'Manage your Bus',
                    image: const Image(
                      image: AssetImage('assets/images/bus.png'),
                    ),
                    cardColor: AppColor.themePimaryColor,
                  ),
                  CustomCard(
                    title: 'Driver',
                    subTitle: 'Manage your Driver',
                    image: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child:
                          Image(image: AssetImage('assets/images/driver.png')),
                    ),
                    cardColor: AppColor.themSecondaryColor,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const DriverListScreen();
                        }),
                      );
                    },
                  ),
                ],
              ),
              KSizedBox.kheight20,
              const Text(
                '4 Buses Found',
              ),
              KSizedBox.kheight20,
              ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFC2C2C2).withOpacity(0.3),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFC2C2C2),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    height: 73,
                    child: Row(
                      children: [
                        Container(
                          height: 73,
                          width: 79,
                          decoration: BoxDecoration(
                            color: AppColor.greyColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Image.asset('assets/images/bus 2.png'),
                        ),
                        KSizedBox.kwidth5,
                        const SizedBox(
                          width: 148,
                          child: Text('KSRTC\nSwift Scania P-series'),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => index.isOdd
                                    ? const BusDetailsScreen()
                                    : const BusDetailsScreen2(),
                              ),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 30,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColor.themePimaryColor,
                            ),
                            child: Center(
                                child: Text(
                              'Manage',
                              style: TextStyle(color: AppColor.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return KSizedBox.kheight10;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
