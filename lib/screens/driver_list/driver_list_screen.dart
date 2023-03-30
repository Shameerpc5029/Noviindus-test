import 'package:flutter/material.dart';

import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/screens/add_driver/add_driver_screen.dart';

import 'package:moovbe_bus/screens/widgets/custom_textbutton.dart';

class DriverListScreen extends StatelessWidget {
  const DriverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver List'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("21 Drivers Found"),
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
                      BoxShadow(color: Color(0xFFC2C2C2), blurRadius: 3)
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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/person.png'),
                          ),
                        ),
                      ),
                      KSizedBox.kwidth5,
                      const SizedBox(
                        width: 148,
                        child: Text('Rohit sharma\nLicn no: PJ5151961616'),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
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
                            'Delete',
                            style: TextStyle(color: AppColor.white),
                          )),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => KSizedBox.kheight10,
              itemCount: 4,
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddDriverScreen(),
              ),
            );
          },
          text: 'Add Driver',
        ),
      ),
    );
  }
}
