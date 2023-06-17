import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_circular_bd/pages/details_Page/railway_details.dart';

import '../app_style/app_color.dart';
import '../helper/Railway_jobs_helper.dart';
import '../model/railway_jobs_model.dart';

class Railway extends StatefulWidget {
  const Railway({super.key});

  @override
  State<Railway> createState() => _RailwayState();
}

class _RailwayState extends State<Railway> {
  RailwayJobsModel? dataModel;

  bool isLoader = false;
  purseData() async {
    dataModel = await RailwayJobsHelper().getData();
    if (dataModel != null) {
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
        body: dataModel != null
            ? ListView.builder(
                itemCount: dataModel!.data!.length,
                itemBuilder: (_, index) {
                  return InkWell(
                   onTap: () {
                      Get.to(() => RailwayDetails(), arguments: [
                        {
                          'title': dataModel!.data![index].title,
                        },
                        {
                          'deadline': dataModel!.data![index].deadline,
                        },
                        {
                          'applylink': dataModel!.data![index].applyLink,
                        },
                        {
                          'type': dataModel!.data![index].type,
                        },
                        {
                          'images': dataModel!.data![index].images,
                        }
                      ]);
                    },
                    child: Card(
                      elevation: 3,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataModel!.data![index].title!,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Deadline : " + dataModel!.data![index].deadline!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: AppColor.button_color),
                            ),
                            // Container(
                            //   height: 500,
                            //   width: MediaQuery.of(context).size.width,
                            //   child: Image.network(
                            //     dataModel!.data![index].images![0].url.toString(),
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(
                  color: AppColor.button_color,
                ),
              ));
  }
}
