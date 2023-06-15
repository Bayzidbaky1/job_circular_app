import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_style/app_color.dart';
import '../helper/govt_jobs_helper.dart';
import '../model/govt_jobs_model.dart';
import 'details_Page/govt_details.dart';

class Govt extends StatefulWidget {
  const Govt({super.key});

  @override
  State<Govt> createState() => _GovtState();
}

class _GovtState extends State<Govt> {
  GovtJobsModel? dataModel;

  bool isLoader = false;
  purseData() async {
    dataModel = await GovtJobsHelper().getData();
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
                  return GestureDetector(
                    
                    onTap: () {
                      Get.to(GovtDetails(Datas:{
                        'title': dataModel!.data![index].title,
                        'deadline': dataModel!.data![index].deadline,
                        'applylink': dataModel!.data![index].applyLink,
                        'images': dataModel!.data![index].images![index].url
                            ,
                      }));
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
                            Container(
                              height: 500,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                dataModel!.data![index].images![0].url
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            // Container(
                            //   height: 500,
                            //   width: MediaQuery.of(context).size.width,
                            //   child: Image.network(
                            //     dataModel!.data![index].images![1].url
                            //         .toString(),
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
                  color: Colors.red,
                ),
              ));
  }
}
