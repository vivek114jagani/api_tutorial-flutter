// ignore_for_file: depend_on_referenced_packages, avoid_print

import '../model/my_data.dart';
import 'package:http/http.dart' as http;
import '../res/api_constans.dart';

class DataCall {
  Future<MyData?> datacall() async {
    var clint = http.Client();
    try {
      var answer = await clint.get(
        Uri.parse("${ApiConstants.start}${ApiConstants.end}"),
      );
      if (answer.statusCode == 200) {
        return myDataFromJson(answer.body);
      } else {
        print("hello world");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
