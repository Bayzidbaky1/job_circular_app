import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/bank_jobs_model.dart';

class BankJobsHelper {
  Future<BankJobsModel?> getData() async {
    var client = http.Client();
    var response = await client
        .get(Uri.parse("https://api.emearn365.com/api/bank/jobs"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return BankJobsModel.fromJson(data);
    } else {
      return null;
    }
  }
}
