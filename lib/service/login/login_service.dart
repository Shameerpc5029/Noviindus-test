import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:moovbe_bus/common/api/base_url.dart';
import 'package:moovbe_bus/common/api/endpoints.dart';
import 'package:moovbe_bus/model/login/login_model.dart';

import 'package:moovbe_bus/utils/interceptor/interceptor.dart';

class LoginService {
  Dio dio = Dio();

  Future<dynamic> loginService(AuthModel model) async {
    try {
      final Response response = await dio.post(
        BaseUrl.baseUrl + Endpoints.login,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final LoginModel loginRes = LoginModel.fromJson(response.data);
        log(loginRes.toString());
        return loginRes;
      } else {
        return;
      }
    } catch (e) {
      log("login failed");
      DioException().dioError(e);
    }
    return null;
  }
}
