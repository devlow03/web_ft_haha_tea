import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_logic.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ProductLogic());

    return Container();
  }
}
