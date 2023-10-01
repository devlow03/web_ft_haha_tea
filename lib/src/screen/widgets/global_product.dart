import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../home/home_logic.dart';

class GlobalProduct extends StatefulWidget {
  final String? imageLink;
  final String? nameProduct;
  final dynamic price;
  final String? numStar;
  final String? shortDes;

  // final String? shortDescript;
  const GlobalProduct({
    Key? key,
    this.imageLink,
    this.nameProduct,
    this.price,
    this.shortDes,
    this.numStar,
    // this.shortDescript


  }) : super(key: key);


  @override
  State<GlobalProduct> createState() => _GlobalProductState();
}

class _GlobalProductState extends State<GlobalProduct> {


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic(Get.find()));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
                color: Colors.grey.shade200
            )
          // Color(0xffE0E5EC),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade50,
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: Offset(0, 2), // changes position of shadow
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
             BorderRadius.only(
            topRight: Radius.circular(5),
        topLeft: Radius.circular(5)
        ),
              child: Image.network(
                widget.imageLink ?? '',
                width: MediaQuery
                    .of(
                    context)
                    .size
                    .width *
                    .15,
                height:   MediaQuery.of(context).size.width>800?MediaQuery
                    .of(
                    context)
                    .size
                    .height *
                    .3:MediaQuery
                    .of(
                    context)
                    .size
                    .height *
                    .1,
                fit: MediaQuery.of(context).size.width>800?BoxFit.cover:BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

           Column(
             mainAxisAlignment:
             MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Text(
                   widget.nameProduct ??
                       '',
                   textAlign:
                   TextAlign.center,
                   maxLines: 2,
                   overflow:
                   TextOverflow.ellipsis,
                   style: TextStyle(
                       height: 1,

                       // fontWeight: FontWeight.w500,
                       fontSize: 14,
                       color: Colors.black),
                 ),
               ),
               SizedBox(
                 height: 5,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Text(
                   NumberFormat
                       .simpleCurrency(
                       locale:
                       'vi')
                       .format(widget.price ??
                       0),
                   style: TextStyle(
                       fontSize: 16,
                       color:
                       Colors.black,
                       letterSpacing:
                       0.5,
                       fontWeight:
                       FontWeight
                           .w300),
                 ),
               ),
               const SizedBox(height: 5,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Row(
                   mainAxisAlignment:
                   MainAxisAlignment
                       .start,


                   children: [
                     Icon(Icons.star, color: Colors.orangeAccent, size: 20,),
                     const SizedBox(width: 3,),
                     Text(
                       '4.5/5(100+)',
                       style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                           color: Colors.black54
                       ),
                     ),

                     // const SizedBox(width: 60,),
                     // Container(
                     //     padding:
                     //     EdgeInsets.all(5),
                     //     decoration: BoxDecoration(
                     //         shape: BoxShape
                     //             .circle,
                     //         color: Color(
                     //             0xffFFE7CC)),
                     //     child: Image.asset(
                     //       'assets/icons/cart_icon.png',
                     //       width: 25,
                     //       height: 25,
                     //     ))
                   ],
                 ),
               )
             ],
           )
          ],
        ),
      ),
    );
  }
}
