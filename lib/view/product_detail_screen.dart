import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/model/home_data.dart';
import 'package:ecommerce/model/product_detail.dart' as productDetail;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductController productController = Get.find();
  ProductDetailScreen({super.key, required this.product});
  final BestSeller product;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productController
          .getProductDetail(product.slug), // Use that variable here.
      builder: (context, snapshot) {
        if (snapshot.hasData) {
        // final product = snapshot.data['product'] as productDetail.Product;
        final productDetails = productDetail.ProductDetailModel.fromJson(snapshot.data!);
          print("-----------------------------------------------------");

          print(productDetails);
          return Scaffold(
            body: SingleChildScrollView(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                      Image.network(
                        "https://swan.alisonsnewdemo.online/images/product/${productDetails.product!.images!.first.image}",
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 30,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.arrow_back_sharp)),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.share)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite)),
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed('/cart');
                                      },
                                      icon: Icon(Icons.shopping_basket)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  Text(productDetails.product!.manufacturer!),
                  Text(productDetails.product!.name!),
                  Text(productDetails.product!.price!),
                  Text(productDetails.product!.oldprice!),
                  Text("Select Color"),
                ],
              ),
            )),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
