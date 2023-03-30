import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:moovbe_bus/common/api/base_url.dart';
import 'package:moovbe_bus/common/api/endpoints.dart';
import 'package:moovbe_bus/model/login/login_model.dart';
import 'package:moovbe_bus/utils/exeptions/dio_exceptions.dart';

class LoginService {
  Dio dio = Dio();

  Future<LoginModel?> loginService(AuthModel model) async {
    try {
      final Response response = await dio.post(
        BaseUrl.baseUrl + Endpoints.login,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final LoginModel loginModel = LoginModel.fromJson(response.data);
        log(loginModel.toString());
        return loginModel;
      }
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   final loginRes = LoginModel.fromJson(response.data);
      //   log(loginRes.toString());
      //   return loginRes;
      // }
    } catch (e) {
      log("login failed");
      DioException().dioError(e);
    }
    return null;
  }
}
