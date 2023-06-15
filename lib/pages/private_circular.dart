import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/jobs_helper.dart';
import '../model/jobs_model.dart';

class Private extends StatefulWidget {
  const Private({super.key});

  @override
  State<Private> createState() => _PrivateState();
}

class _PrivateState extends State<Private> {
 
 AllDataModel? dataModel;

  bool isLoader = false;
  purseData()async{
    dataModel = await JobsHelper().getData();
    if (dataModel!=null) {

      setState(() {
        isLoader = true;
      });
      
    }
  }
@override
  void initState() {
    purseData();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoader,
        replacement: Center(child: CircularProgressIndicator(color: Colors.red,),),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dataModel!.data!.length,
          itemBuilder: (_,index){
         return Card(
          child: Column(
            children: [
                 Text(dataModel!.data![index].title!)
            ],
          ),
         );
          })),
      );
  }
}
