import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Private extends StatefulWidget {
  const Private({super.key});

  @override
  State<Private> createState() => _PrivateState();
}

class _PrivateState extends State<Private> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Visibility(
      //     visible: isLoader,
      //     replacement: Center(
      //       child: CircularProgressIndicator(
      //         color: Colors.red,
      //       ),
      //     ),
      //     child: ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: dataModel!.data!.length,
      //         itemBuilder: (_, index) {
      //           return Column(
      //             children: [Text(dataModel!.data![index].title!)],
      //           );
      //         })),
    );
  }
}
