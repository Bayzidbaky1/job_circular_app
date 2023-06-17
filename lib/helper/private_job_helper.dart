import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/govt_jobs_model.dart';
import '../model/private_job_model.dart';

class PrivateJobsHelper {
  Future<PrivateJobsModel?> getData() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse("https://api.emearn365.com/api/private/jobs"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return  PrivateJobsModel.fromJson(data);
    }else{
      return null;
    }
  }
}
