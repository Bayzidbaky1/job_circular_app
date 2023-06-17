import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_circular_bd/pages/details_Page/bank_details.dart';

import '../app_style/app_color.dart';
import '../helper/bank_job_helper.dart';
import '../helper/govt_jobs_helper.dart';
import '../model/bank_jobs_model.dart';
import '../model/govt_jobs_model.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  BankJobsModel? dataModel;

  bool isLoader = false;
  purseData() async {
    dataModel = await BankJobsHelper().getData();
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
                      Get.to(() => BankDetails(), arguments: [
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
