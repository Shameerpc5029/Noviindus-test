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
            ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Material(
                  elevation: 3,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                    ),
                    title: const Text('Rohit sharma'),
                    subtitle: const Text('Lic no: NKDSGIJ978'),
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColor.themePimaryColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Delete',
                        )),
                  ),
                );
              },
              separatorBuilder: (context, index) => KSizedBox.kheight10,
              itemCount: 5,
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
