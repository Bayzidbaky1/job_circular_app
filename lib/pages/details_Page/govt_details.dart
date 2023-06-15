import 'package:flutter/material.dart';

import '../../app_style/app_color.dart';

class GovtDetails extends StatelessWidget {
  var Datas;
  GovtDetails({required this.Datas});
  @override
  Widget build(BuildContext context) {
    // print("Datas");
    // print(Datas);
     print(" Datas['images'][0].toString()");
    print( Datas['images'].toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.button_color,
        centerTitle: true,
        title: Text(Datas['title']),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Datas['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                  SizedBox(height: 8,),
                  Text("Deadline : " +Datas['deadline'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                  SizedBox(height: 8,),
                  Text("Apply Link : " +Datas['applylink'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blue),),
                    
                  // Container(
                  //   height: 500,
                  //   child:Image.network(Datas['images'][0].toString()),
                  // ),
                  // Container(
                  //   height: 500,
                  //   child:Image.network(Datas['images'][1].toString()),
                  // ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
