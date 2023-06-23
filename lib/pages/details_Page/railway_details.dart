import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_style/app_color.dart';

class RailwayDetails extends StatefulWidget {
  @override
  State<RailwayDetails> createState() => _RailwayDetailsState();
}

class _RailwayDetailsState extends State<RailwayDetails> {
  var arg = Get.arguments;
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  @override
  void initState() {
    controller = TransformationController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.button_color,
        centerTitle: true,
        title: Text(arg[0]['title']),
      ),
      body: Container(
        height: 800,
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
                          return Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: InteractiveViewer(
                              minScale: 0.1,
                              maxScale: 5.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  arg[4]['images'][index].url,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        }),

                    // buildImage(),

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

  // Widget buildImage() => GestureDetector(
  //   onDoubleTapDown: ((details) => tapDownDetails=details),
  //       onDoubleTap: () {
  //       final position = tapDownDetails!.localPosition;
  //         final double scale = 3;
  //         final x = -position.dx * (scale -1);
  //         final y = -position.dy * (scale -1);

  //         final zoomed = Matrix4.identity()
  //         ..translate(x,y)
  //         ..scale(scale);
  //         final value = controller.value.isIdentity()?zoomed:Matrix4.identity();
  //         controller.value = value;
  //       },
  //       child: InteractiveViewer(
  //         clipBehavior: Clip.none,
  //         panEnabled: false,
  //         scaleEnabled: false,
  //         transformationController: controller,
  //         child: ListView.builder(
  //             padding: EdgeInsets.zero,
  //             shrinkWrap: true,
  //             primary: false,
  //             itemCount: arg[4]['images'].length,
  //             itemBuilder: (_, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.only(top: 15),
  //                 child: Container(

  //                   width: MediaQuery.of(context).size.width,
  //                   child: Image.network(
  //                     arg[4]['images'][index].url,
  //                     fit: BoxFit.fill,
  //                   ),
  //                 ),
  //               );
  //             }),
  //       ),
  //     );

  // Widget zoomImage() => AspectRatio(
  //     aspectRatio: 1,
  //     child: InteractiveViewer(
  //       child: ClipRRect(
  //           borderRadius: BorderRadius.circular(2),
  //           child: ListView.builder(
  //               padding: EdgeInsets.zero,
  //               shrinkWrap: true,
  //               primary: false,
  //               itemCount: arg[4]['images'].length,
  //               itemBuilder: (_, index) {
  //                 return Padding(
  //                   padding: const EdgeInsets.only(top: 15),
  //                   child: Container(
  //                     height: MediaQuery.of(context).size.height,
  //                     width: MediaQuery.of(context).size.width,
  //                     child: Image.network(
  //                       arg[4]['images'][index].url,
  //                       fit: BoxFit.fill,
  //                     ),
  //                   ),
  //                 );
  //               })),
  //     ));
}
