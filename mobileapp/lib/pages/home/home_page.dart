import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/pages/home/main_food_page.dart';
import 'package:mobileapp/utils/colors.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page")),),
    Container(child: Center(child: Text("Next Next Page")),),
    Container(child: Center(child: Text("Next Next Next Page")),),
    
  ];
   void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive,),
            label: "history"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "cart"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "me"
          ),
        ],
      ),
    );
  }
}