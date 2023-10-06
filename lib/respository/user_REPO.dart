// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print

import '../model/sample.dart';
import 'package:http/http.dart' as http;
import '../res/api_constans.dart';

class UserRepo {
  Future<Sample?> userData() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse("${ApiConstants.baseUrl}${ApiConstants.getUser}"),
      );
      if (response.statusCode == 200) {
        return sampleFromJson(response.body);
      } else {
        null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
