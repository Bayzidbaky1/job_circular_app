import 'package:flutter/material.dart';
import 'package:jobs_circular_bd/helper/comment_helper.dart';
import 'package:jobs_circular_bd/model/comment_model.dart';
import 'package:jobs_circular_bd/pages/bank_details.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  bool loader = false;
  List<CommentModel>? Datas;

  getData() async {
    Datas = await CommentHelper().getComment();

    setState(() {
      loader = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: loader,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: Datas?.length ?? 0,
            itemBuilder: (_, index) {
              if (Datas == null) {
                return SizedBox(); // Return an empty widget or a placeholder when Datas is null
              }
              return InkWell(
                onTap: () {
                  //this map sent data to details screen to Argument
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BankDetails(data: {
                                "id": Datas![index].id,
                                "postId": Datas![index].postId,
                                "name": Datas![index].name,
                                "email": Datas![index].email,
                                "body": Datas![index].body,
                              })));
                },
                child: Card(
                  elevation: 3,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              Datas![index].id.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                        Text(
                          Datas![index].name.toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Datas![index].email.toString(),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          Datas![index].body.toString(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
