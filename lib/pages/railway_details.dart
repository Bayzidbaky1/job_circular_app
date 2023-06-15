import 'package:flutter/material.dart';

import '../app_style/app_color.dart';

class RailwayDetails extends StatelessWidget {
  var data;
  RailwayDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    print('Image new ${data['images']}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.button_color,
        centerTitle: true,
        title: Text(data['title']),
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
                    Text(
                      data['title'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Deadline : " + data['deadline'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Job Type : " + data['type'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Apply Link : " + data['applylink'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(data['images']),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Container(
                    //   height: 500,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Image.network(data['images'][1].toString()),//wait dissi
                    // ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
