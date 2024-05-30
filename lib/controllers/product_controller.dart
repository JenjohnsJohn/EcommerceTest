import 'dart:convert';

import 'package:ecommerce/model/home_data.dart';
import 'package:ecommerce/model/product_detail.dart';
import 'package:ecommerce/services/http_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


class ProductController extends GetxController {
  RxBool loading = false.obs;
 

  @override
  void onInit() {
    super.onInit();
    
  }

  

  Future<dynamic> getProductDetail(String productSlug) async {
    
    loading.value = true;
    HTTPService httpService = Get.find();
    var responseData = await httpService.post("product-details/en/${productSlug}?");
    
    
    
    loading.value = false;
    return  responseData;
    
  }

 
}
