import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_ft_milk_tea/src/screen/widgets/global_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic(Get.find()));
    int itemCount = 6;
    if(MediaQuery.of(context).size.width>1000){
      itemCount = 6;
    }
    else{
      if(MediaQuery.of(context).size.width>700){
        itemCount=4;
      }
      else{
        itemCount=2;
      }
    }

    return Scaffold(
      body: Obx(() {
        return ListView(
          children: [
            CarouselSlider.builder(
              itemCount: ((logic.getBannerRsp.value?.banner?.length ?? 0)/2).round(),
              options: CarouselOptions(
                aspectRatio: 20 / 4,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 7),
                // enlargeCenterPage: true,

                onPageChanged: (index, reason) {
                  logic.activeIndex.value = index;
                },

                viewportFraction: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                final int first = index * 2;
                final int second = first + 1;
                return Row(
                  children: [first, second].map((idx){
                    return Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(logic.getBannerRsp.value?.banner?[idx].name??"", fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: logic.getProductRsp.value?.products?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = logic.getProductRsp.value?.products;
                  return Container(
                    width: MediaQuery.of(context).size.width*2,
                    child: GlobalProduct(
                      imageLink: data?[index].thumnail,
                      nameProduct: data?[index].name,
                      price: double.parse(data?[index].price.toString()??""),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: itemCount,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 3 / 4.5,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
