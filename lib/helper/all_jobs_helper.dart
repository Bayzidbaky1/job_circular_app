// import 'package:http/http.dart' as http;

// import '../model/all_jobs_model.dart';

// class AllJobsHelper{
//   Future<List<AllJobsModel>?> getAllJobs()async{

//     var response = await http.get(Uri.parse(" http://api.emearn365.com/api/jobs"));

//     if(response.statusCode == 200){
//       var data = response.body;

//       print(data);

//       return [allJobsModelFromJson(data)];
//     }
    
//   }
// }