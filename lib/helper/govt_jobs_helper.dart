import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/govt_jobs_model.dart';

class GovtJobsHelper {
  Future<GovtJobsModel?> getData() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse("https://api.emearn365.com/api/govt/jobs"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return GovtJobsModel.fromJson(data);
    }else{
      return null;
    }
  }
}
