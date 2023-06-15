import 'package:flutter/material.dart';
import 'package:jobs_circular_bd/app_style/app_color.dart';

class Search extends StatelessWidget {
  Search({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: SafeArea(
            child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color:AppColor.button_color),
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
                child: Container(
              height: 400,
              color: Colors.white,
            ))
          ],
        )),
      ),
    );
  }
}
