import 'package:get/get.dart';
import 'package:web_ft_milk_tea/src/data/request/request.dart';

import '../../data/response/get_banner_rsp.dart';
import '../../data/response/get_product_rsp.dart';

class HomeLogic extends GetxController {
  final Request _Request;
  HomeLogic(this._Request);
  Rxn<GetProductRsp>getProductRsp = Rxn();
  Rxn<GetBannerRsp>getBannerRsp = Rxn();
  Rxn<int>activeIndex = Rxn(0);
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    await getBanner();
    await getProduct();

  }

  @override
  void refresh(){
    super.refresh();
    getProduct();
  }

  Future<GetProductRsp?>getProduct()async{
    getProductRsp.value = await _Request.getProductRsp();

    return getProductRsp.value;
  }

  Future<GetBannerRsp?>getBanner()async{
    getBannerRsp.value = await _Request.getBannerRsp();
    return getBannerRsp.value;
  }

}
