// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:developer';

import 'package:api_calling/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../res/api_constans.dart';

class GetUserRepo {
  Future<UserDataModel?> getUserData() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.getUser}",
        ),
      );
      log(response.body);     // not important.
      if (response.statusCode == 200) {
        return userDataModelFromJson(response.body);
      } else {
        print("Soothing went wrong: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
