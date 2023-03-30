import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:moovbe_bus/common/api/base_url.dart';
import 'package:moovbe_bus/common/api/endpoints.dart';
import 'package:moovbe_bus/model/driver_list/add_driver_model.dart';
import 'package:moovbe_bus/model/driver_list/driver_list_model.dart';
import 'package:moovbe_bus/utils/exeptions/dio_exceptions.dart';
import 'package:moovbe_bus/utils/interceptor/interceptor.dart';

class DriverListService {
  Future<DriverListModel?> getDriverList(urlId) async {
    Dio dio = await IntercepterApi().getApiUser();

    try {
      final Response response = await dio.get(
        BaseUrl.baseUrl + Endpoints.driverList + urlId,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final DriverListModel model = DriverListModel.fromJson(response.data);
          log(response.data.toString());
          return model;
        }
      }
    } catch (e) {
      log(e.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<String?> addDriver(AdddriverModel model, urlId) async {
    Dio dios = await IntercepterApi().getApiUser();
    try {
      final Response response = await dios.post(
        BaseUrl.baseUrl + Endpoints.driverList + urlId,
        data: jsonEncode(
          model.toJson(),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final driverResponse = response.data['message'];
        return driverResponse;
      }
    } catch (e) {
      log(e.toString());
      DioException().dioError(e);
    }
    return null;
  }

  Future<String?> removeDriver(urlId, id) async {
    Dio dio = await IntercepterApi().getApiUser();
    try {
      final Response response = await dio.delete(
        BaseUrl.baseUrl + Endpoints.driverList + urlId,
        data: {
          "driver_id": id,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final remove = response.data['message'];
        return remove;
      }
    } catch (e) {
      log(e.toString());
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
