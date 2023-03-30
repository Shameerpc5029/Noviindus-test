import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/model/driver_list/add_driver_model.dart';
import 'package:moovbe_bus/model/driver_list/driver_list_model.dart';

import 'package:moovbe_bus/service/driver_list/driver_list_service.dart';
import 'package:moovbe_bus/utils/exeptions/dio_exceptions.dart';

class DriverListController extends ChangeNotifier {
  DriverListController() {
    getAllDrivers();
  }

  DriverListModel? model;
  bool isLoading = false;

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

  TextEditingController name = TextEditingController();
  TextEditingController licenseNo = TextEditingController();

  void addDriver(context) async {
    final urlId = await storage.read(key: 'refresh');
    isLoading = true;
    notifyListeners();
    final AdddriverModel model = AdddriverModel(
      name: name.text,
      mobile: "1234556",
      licenseNo: licenseNo.text,
    );
    await DriverListService().addDriver(model, "$urlId/").then((value) {
      if (value != null) {
        getAllDrivers();
      }
      if (value == "successfully created new driver") {
        AppToast.showToast(
          'New Driver added successfully',
          Colors.green,
        );
        Navigator.of(context).pop();
        clearFiled();
        notifyListeners();
      } else {
        null;
      }
    });
  }

  void removeDriver(context, driverId) async {
    final urlId = await storage.read(key: 'refresh');

    DriverListService().removeDriver("$urlId/", driverId).then((value) {
      if (value != null) {
        getAllDrivers();

        AppToast.showToast(
          'Driver removed Successfully',
          AppColor.alertColor,
        ).then((value) => Navigator.pop(context));

        notifyListeners();
      } else {
        return;
      }
    });
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter Name";
    }
    return null;
  }

  String? licNumeberValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter License Number";
    }
    return null;
  }

  void clearFiled() {
    name.clear();
    licenseNo.clear();
  }
}
