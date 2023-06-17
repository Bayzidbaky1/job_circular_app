import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_style/app_color.dart';
import '../helper/all_jobs_helper.dart';
import '../model/all_jobs_model.dart';
import 'details_Page/all_jobs_details.dart';

class AllCircular extends StatefulWidget {
  const AllCircular({Key? key}) : super(key: key);

  @override
  State<AllCircular> createState() => _AllCircularState();
}

class _AllCircularState extends State<AllCircular> {
  AllJobsModel? dataModel;

  bool isLoader = false;
  purseData() async {
    dataModel = await AllJobsHelper().getData();
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
                      Get.to(() => AllJobsDetails(), arguments: [
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
