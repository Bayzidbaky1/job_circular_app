import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_circular_bd/app_style/app_color.dart';

import '../helper/search_helper.dart';
import '../model/search_model.dart';
import 'details_Page/all_jobs_details.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  SearchModel? dataModel;
  purseData() async {
    dataModel = await SearchHelper().getData(_searchController.text.toString());
    if (dataModel == null) {
      print("data not mached");
    }
    setState(() {});
  }

  @override
  void initState() {
    purseData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: SafeArea(
            child: Column(
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  purseData();
                });
              },
              style: TextStyle(color: Colors.white),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: AppColor.button_color),
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColor.button_color,
                  size: 28,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: dataModel != null
                    ?  ListView.builder(
                        itemCount: dataModel!.data!.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => AllJobsDetails(), arguments: [
                                {
                                  'title': dataModel!.data![index].title,
                                },
                                {
                                  'deadline': dataModel!.data![index].deadline,
                                },
                                {
                                  'applylink':
                                      dataModel!.data![index].applyLink,
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
                                      "Deadline : " +
                                          dataModel!.data![index].deadline!,
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
                        }):Center(
                        child:Text("No Data Matched",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black54),)
                      )
                    )
          ],
        )),
      ),
    );
  }
}
