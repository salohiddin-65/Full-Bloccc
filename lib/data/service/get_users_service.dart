import 'dart:io';
import 'package:_full_blocccccc_project/core/config/dio_catch_error_config.dart';
import 'package:_full_blocccccc_project/core/config/dio_config.dart';
import 'package:_full_blocccccc_project/core/constant/project_url.dart';
import 'package:_full_blocccccc_project/data/model/users_model.dart';
import 'package:dio/dio.dart';

class UsersService {
  Future<dynamic> getUsers() async {
    try {
      Response response = await DioConfig.createRequest().get(ProjectUrl.users);
      if (response.statusCode == HttpStatus.ok) {
        return (response.data as List)
            .map((e) => UsersModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
