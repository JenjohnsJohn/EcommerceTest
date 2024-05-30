import 'dart:convert';

import 'package:ecommerce/model/home_data.dart';
import 'package:ecommerce/services/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  RxBool loading = false.obs;
  RxList<BannerData> featuredBanner = <BannerData>[].obs;
  RxList<BannerData> homeBannerOne = <BannerData>[].obs;
  RxList<BannerData> homeBannerTwo = <BannerData>[].obs;
  RxList<Featuredbrand> featuredbrands = <Featuredbrand>[].obs;
  RxList<BestSeller> ourProducts = <BestSeller>[].obs;
  RxList<BestSeller> flashSail = <BestSeller>[].obs;
  RxList<Ory> category = <Ory>[].obs;
  RxList<String> ourProductImages =  <String>[].obs;
  
 

  @override
  void onInit() {
    super.onInit();
    _getHome();
  }

  Future<void> _getHome() async {
    loading.value = true;
    HTTPService httpService = Get.find();
    var responseData = await httpService.post("home");
    HomeData homeData = HomeData.fromJson(responseData);
    print("API Called");
    print(homeData);
     for(BestSeller product in homeData.ourProducts ){
      ourProductImages.add("https://swan.alisonsnewdemo.online/images/product/${product.image}");
    }
    featuredBanner.value = homeData.banner1 ?? [];
    homeBannerOne.value = homeData.banner2 ?? [];
    homeBannerTwo.value = homeData.banner3 ?? [];
    category.value = homeData.categories ?? [];
    featuredbrands.value = homeData.featuredbrands ?? [];
   
    print(ourProductImages);
    
    ourProducts.value = homeData.ourProducts ?? [];
    flashSail.value = homeData.flashSail ?? [];
    print(featuredbrands.value);
    loading.value = false;
  }

 
}
