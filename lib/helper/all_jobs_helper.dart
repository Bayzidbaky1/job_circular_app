import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/all_jobs_model.dart';

class AllJobsHelper {
  Future<AllJobsModel?> getData() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse("http://api.emearn365.com/api/jobs"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return AllJobsModel.fromJson(data);
    } else {
      return null;
    }
  }
}
