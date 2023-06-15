import 'package:flutter/material.dart';
import 'package:jobs_circular_bd/pages/all_circular.dart';
import 'package:jobs_circular_bd/pages/bangk_circular.dart';
import 'package:jobs_circular_bd/pages/govt_circular.dart';
import 'package:jobs_circular_bd/pages/private_circular.dart';
import 'package:jobs_circular_bd/pages/railway_circular.dart';
import 'package:jobs_circular_bd/pages/search_page.dart';

import '../app_style/app_color.dart';
import '../widget/drwar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: new Drawer(
          backgroundColor: Colors.grey.shade700,
          child: new ListView(
            children: [Drwar.drwr],
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.button_color,
          centerTitle: true,
          title: Text(
            "BD Job Circular",
            style: AppStyle.text_styl,
          ),
          bottom: TabBar(
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
              indicatorColor: AppColor.button_color,
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Govt',
                ),
                Tab(
                  text: 'Bank',
                ),
                Tab(
                  text: 'RailWay',
                ),
                Tab(
                  text: 'Private',
                ),
              ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Search()));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 28,
                    )),
              ],
            )
          ],
        ),
        body: TabBarView(children: [
          AllCircular(),
          Govt(),
          Bank(),
          Railway(),
          Private(),
        ]),
      ),
    );
  }
}
