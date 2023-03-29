import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/screens/home/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Image(
            height: 40,
            image: AssetImage(
              'assets/images/logo.png',
            )),
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
                    image: 'assets/images/bus.png',
                    cardColor: AppColor.themePimaryColor,
                  ),
                  CustomCard(
                    title: 'Driver',
                    subTitle: 'Manage your Driver',
                    image: 'assets/images/driver.png',
                    cardColor: AppColor.themSecondaryColor,
                  ),
                ],
              ),
              KSizedBox.kheight20,
              const Text(
                '21 Buses Found',
              ),
              KSizedBox.kheight20,
              ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1,
                    child: ListTile(
                      tileColor: Colors.white,
                      contentPadding: const EdgeInsets.only(right: 10),
                      leading: Container(
                        color: AppColor.greyColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/bus 2.png'),
                        ),
                      ),
                      title: const Text(
                        'KSRTC',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: const Text(
                        'swift Scania p- serius',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColor.themePimaryColor,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Manage',
                          )),
                      onTap: () {},
                    ),
                  );
                },
                itemCount: 10,
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
