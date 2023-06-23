import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_style/app_color.dart';

class GovtDetails extends StatelessWidget {
  var arg = Get.arguments;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.button_color,
        centerTitle: true,
        title: Text(arg[0]['title']),
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
                      arg[0]['title'],
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Deadline : " + arg[1]['deadline'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Job Type : " + arg[3]['type'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Apply Link : ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Text(
                          arg[2]['applylink'],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FlutterClipboard.copy(arg[2]['applylink']);
                          Get.snackbar("Copyed Link", arg[2]['applylink']);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.button_color,
                        ),
                        child: Text("Copy Link")),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: arg[4]['images'].length,
                        itemBuilder: (_, index) {
                          return arg[4]['images'] != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: InteractiveViewer(
                                    minScale: 0.1,
                                    maxScale: 5.0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.network(
                                        arg[4]['images'][index].url,
                                        fit: BoxFit.fill,
                                      ), //wait dissi
                                    ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: AppColor.button_color,
                                  ),
                                );
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
