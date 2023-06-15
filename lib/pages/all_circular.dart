import 'package:flutter/material.dart';

import '../helper/all_jobs_helper.dart';
import '../model/all_jobs_model.dart';

class AllCircular extends StatefulWidget {
  const AllCircular({Key? key}) : super(key: key);

  @override
  State<AllCircular> createState() => _AllCircularState();
}

class _AllCircularState extends State<AllCircular> {

  // List<AllJobsModel>? AllJobs;

  // getData()async{
  //   AllJobs = await AllJobsHelper().getAllJobs();
  // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:AllJobs !=null?
      // ListView.builder(
      //   itemCount: AllJobs!.length,
      //   itemBuilder: (_,index){
          
      //     return Card(
      //       elevation: 4,
      //       color: Colors.amber,
      //       child: Column(
      //           children: [
      //             // Text(AllJobs![index].data.title.toString())
      //           ],
      //       ),
      //     );
      // }):Center(child: CircularProgressIndicator(),)
    );
  }
}
