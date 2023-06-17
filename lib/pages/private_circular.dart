import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_style/app_color.dart';
import '../helper/private_job_helper.dart';
import '../model/private_job_model.dart';
import 'details_Page/private_jobs_details.dart';

class Private extends StatefulWidget {
  const Private({super.key});

  @override
  State<Private> createState() => _PrivateState();
}

class _PrivateState extends State<Private> {
   PrivateJobsModel? dataModel;

  bool isLoader = false;
  purseData() async {
    dataModel = await PrivateJobsHelper().getData();
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
                      Get.to(() => PrivateJobDetails(), arguments: [
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
                      ;
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
