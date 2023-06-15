import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/jobs_model.dart';

class JobsHelper {
  Future<AllDataModel?> getData() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse(" http://api.emearn365.com/api/jobs"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return AllDataModel.fromJson(data);
    }else{
      return null;
    }
  }
}
