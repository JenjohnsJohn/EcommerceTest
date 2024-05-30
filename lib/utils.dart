import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/services/http_service.dart';
import 'package:get/get.dart';


Future<void> registerServices() async {
  Get.put(
    HTTPService(),
  );
}

Future<void> registerControllers() async {
  Get.put(
    ProductController()
  );
  Get.put(
    HomeController()
  );
}

String getCryptoImageURL(String name) {
  return "https://raw.githubusercontent.com/ErikThiart/cryptocurrency-icons/master/128/${name.toLowerCase()}.png";
}
