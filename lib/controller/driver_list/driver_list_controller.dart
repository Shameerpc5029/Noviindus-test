import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moovbe_bus/model/driver_list/driver_list_model.dart';
import 'package:moovbe_bus/model/login/login_model.dart';
import 'package:moovbe_bus/service/driver_list/driver_list_service.dart';

class DriverListController extends ChangeNotifier {
  DriverListController() {
    getAllDrivers();
  }

  // List<DriverList>? driverList = [];
  DriverListModel? model;
  bool isLoading = false;
  // void getAllDrivers() async {
  //   await DriverListService().getDriverList().then((value) {
  //     if (value != null) {
  //       driverList = value;
  //       notifyListeners();
  //       isLoading = false;
  //       notifyListeners();
  //     } else {
  //       log("error");
  //       isLoading = false;

  //       notifyListeners();
  //     }
  //   });
  // }
  FlutterSecureStorage storage = const FlutterSecureStorage();
  void getAllDrivers() async {
    final urlId = await storage.read(key: 'refresh');
    isLoading = true;
    notifyListeners();
    await DriverListService().getDriverList("$urlId/").then(
      (value) {
        if (value != null) {
          model = value;
          notifyListeners();
          isLoading = false;

          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
    notifyListeners();
    return null;
  }
}
