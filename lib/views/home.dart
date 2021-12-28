import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:weight_tracker/views/add_record.dart';
import 'package:weight_tracker/views/graph.dart';
import 'package:weight_tracker/views/history.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab=0;
  Widget _currentScreen = GraphScreen();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(title: Text(""),),

      body: _currentScreen,

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(() => AddRecordView());
        },
        backgroundColor: Colors.black,),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height/12,
          splashColor: Colors.red,
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          backgroundColor: Colors.black,
          gapLocation: GapLocation.center,
          icons: [Icons.show_chart,Icons.history],
          activeIndex: _currentTab,
          onTap: (int){
            setState(() {
              _currentTab = int;
              _currentScreen = (int == 0)?GraphScreen():HistoryScreen();
            });

            print(int);
          }
          ),
    );
  }
}
