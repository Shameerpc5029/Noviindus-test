import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/controller/driver_list/driver_list_controller.dart';
import 'package:moovbe_bus/controller/login/login_controller.dart';
import 'package:moovbe_bus/view/introduction/introduction_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverListController(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              toolbarHeight: 100,
              backgroundColor: AppColor.themSecondaryColor,
            ),
            fontFamily: 'Axiforma',
          ),
          debugShowCheckedModeBanner: false,
          home: const IntroductionScreen()),
    );
  }
}
