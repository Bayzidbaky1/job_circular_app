import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jobs_circular_bd/model/railway_jobs_model.dart';

class RailwayJobsHelper {
  Future<RailwayJobsModel?> getData() async {
    var response =
        await http.get(Uri.parse('https://api.emearn365.com/api/railway/jobs'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return RailwayJobsModel.fromJson(data);
    } else {
      return null;
    }
  }
}
