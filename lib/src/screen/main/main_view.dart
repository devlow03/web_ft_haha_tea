import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_ft_milk_tea/src/screen/home/home_view.dart';
import 'package:web_ft_milk_tea/src/screen/product/product_view.dart';
import 'package:web_ft_milk_tea/src/screen/profile/profile/profile_view.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainLogic());
    // List<Widget> screens = [
    //   HomePage(),
    //   ProductPage(),
    //   ProfilePage()
    // ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text("HAHA MILKTEA"),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.green
        ),
      ),
      body: DefaultTabController(
        // initialIndex: logic.tabIndex.value??0,
          length: 3,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)
                    )
                ),
                child: TabBar(

                  unselectedLabelColor: Colors.black,
                  // onTap: (value){
                  //   logic.tabIndex.value = value;
                  // },
                  indicatorColor: Colors.transparent,
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w700),
                  labelColor: Colors.green,
                  labelStyle: TextStyle(fontWeight: FontWeight.w700),
                  tabs: [
                    Tab(
                      child: Text("Trang chủ")
                    ),
                    Tab(
                      child:Text("Cửa hàng")
                    ),
                    Tab(
                      child: Text("Cá nhân")
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HomePage(),
                    ProductPage(),
                    ProfilePage()
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
