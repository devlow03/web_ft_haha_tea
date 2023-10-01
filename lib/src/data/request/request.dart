import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_ft_milk_tea/src/core/global_data.dart';

import '../response/get_banner_rsp.dart';
import '../response/get_product_rsp.dart';

part 'request.g.dart';
@RestApi(baseUrl:GlobalData.domain)
abstract class Request{
  factory Request(Dio di,{String baseUrl}) = _Request;
  
  @GET('api/normal/products')
  Future<GetProductRsp>getProductRsp();

  @GET('api/normal/banner')
  Future<GetBannerRsp>getBannerRsp();


}
