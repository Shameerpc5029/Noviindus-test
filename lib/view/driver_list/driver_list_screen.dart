import 'package:flutter/material.dart';

import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/controller/driver_list/driver_list_controller.dart';
import 'package:moovbe_bus/view/add_driver/add_driver_screen.dart';
import 'package:moovbe_bus/view/widgets/custom_textbutton.dart';
import 'package:provider/provider.dart';

class DriverListScreen extends StatelessWidget {
  const DriverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DriverListController>(context, listen: false).getAllDrivers();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver List'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Consumer<DriverListController>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : value.model!.driverList.isEmpty
                    ? const Text('No Drivers')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${value.model!.driverList.length.toInt()} Drivers Found"),
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
                                    color: const Color(0xFFC2C2C2)
                                        .withOpacity(0.3),
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
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/person.png'),
                                        ),
                                      ),
                                    ),
                                    KSizedBox.kwidth5,
                                    SizedBox(
                                      width: 148,
                                      child: Text(
                                          '${value.model!.driverList[index].name}\nLicn no: ${value.model!.driverList[index].licenseNo}'),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ShowAlertDialogWidget(
                                              text:
                                                  'Do you want to remove ${value.model!.driverList[index].name}',
                                              onPressed: () {
                                                value.removeDriver(
                                                  context,
                                                  value.model!.driverList[index]
                                                      .id,
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 30,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppColor.themePimaryColor,
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Delete',
                                          style:
                                              TextStyle(color: AppColor.white),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                KSizedBox.kheight10,
                            itemCount: value.model?.driverList.length ?? 0,
                          ),
                        ],
                      );
          },
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

class ShowAlertDialogWidget extends StatelessWidget {
  const ShowAlertDialogWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Remove Driver?'),
        content: Text(
          text,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: onPressed,
            child: const Text('Yes'),
          ),
        ]);
  }
}
