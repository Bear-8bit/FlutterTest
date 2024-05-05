import 'package:flutter/material.dart';
import 'package:flutter_store/app/bottom_nav_bar.dart';
import 'package:flutter_store/app/screen/categories/categories_screen.dart';
import 'package:flutter_store/app/screen/home/home_screen.dart';
import 'package:flutter_store/app/screen/userprofile/user_setting.dart';
import 'package:flutter_store/app/screen/withlist/withlist_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex  = 0;
  List<Widget> pageList = [const HomeScreen(), const CategoriesScreen(), const WithlistScreen(), const UserSetting()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavBar(onIndexChanged: (value){
        setState(() {
          currentIndex = value;
        });
      }),
    );
  }
}