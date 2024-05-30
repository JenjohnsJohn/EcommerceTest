import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/model/home_data.dart';
import 'package:ecommerce/view/product_detail_screen.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.find();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appname"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                Get.toNamed("/cart");
              },
              icon: Icon(Icons.shopping_bag))
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              FeaturedBanner(
                homescreenBanner: homeController.featuredBanner,
              ),
              SectionHeader(
                title: "Our Brands",
                tab: () {},
                viewall: true,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.featuredbrands.length,
                  itemBuilder: (context, index) {
                    print("Our Brands");
                    print(homeController.featuredbrands.length);
                    return HorizontalListTile(
                        homeController.featuredbrands[index].image);
                  },
                  //  [
                  //   HorizontalListTile(),
                  //   HorizontalListTile(),
                  //   HorizontalListTile(),
                  //   HorizontalListTile(),
                  // ],
                ),
              ),
              SectionHeader(
                title: "Our Product",
                tab: () {},
                viewall: true,
              ),
              homeController.ourProductImages.length != 0
                  ? FanCarouselImageSlider.sliderType1(
                      imagesLink: homeController.ourProductImages,
                      isAssets: false,
                      autoPlay: true,
                      sliderHeight: 300,
                      showIndicator: false,
                      turns: 100,
                      imageRadius: 20,
                      slideViewportFraction: .5,
                      isClickable: true,
                    )
                  : SizedBox(),
              // Container(
              //   height: 280,
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: homeController.ourProducts.length,
              //     itemBuilder: (context, index) {
              //       return HorizontalProductTile(
              //         title: homeController.ourProducts[index].name,
              //         image: homeController.ourProducts[index].image,
              //         price: homeController.ourProducts[index].price,
              //         tab: () {},
              //       );
              //     },
              //   ),
              // ),
              SectionHeader(
                title: "Suggested For You",
                tab: () {},
                viewall: true,
              ),
              Container(
                height: 280,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.ourProducts.length,
                  itemBuilder: (context, index) {
                    return HorizontalProductTile(
                      title: homeController.ourProducts[index].name,
                      image: homeController.ourProducts[index].image,
                      price: homeController.ourProducts[index].price,
                      tab: () {
                        
                      },
                      product: homeController.ourProducts[index],
                    );
                  },
                ),
              ),
              Container(
                height: 100,
                child: Image.asset("assets/new_arrival_banner.png"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: MasonryGridView.count(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 1,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      child: NewArrivalProductTile(
                        title: "Product Name",
                        image: "",
                        price: "OMR 75.000",
                        tab: () {},
                        height: index.isEven ? 220 : 100,
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ViewAllText(
                  tap: () {},
                ),
              ),
              HomeBanner(
                homescreenBanner: homeController.homeBannerOne,
              ),
              SectionHeader(
                title: "Bestsellers",
                tab: () {},
                viewall: true,
              ),
              Container(
                height: 280,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.ourProducts.length,
                  itemBuilder: (context, index) {
                    return HorizontalProductTile(
                      title: homeController.ourProducts[index].name,
                      image: homeController.ourProducts[index].image,
                      price: homeController.ourProducts[index].price,
                      tab: () {},
                      product: homeController.ourProducts[index],
                    );
                  },
                ),
              ),
              SectionHeader(
                title: "Trending Category",
                tab: () {},
                viewall: false,
              ),
              Container(
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: homeController.category.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .6,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      print(homeController.category.length);
                      return TrendingCategoryTile(
                        title: homeController.category[index].category.name,
                        image: "",
                        tab: () {},
                      );
                    }),
              ),
              SectionHeader(
                title: "Shop Exclusive Deals",
                tab: () {},
                viewall: false,
              ),
              BannerStyleTwo(
                homescreenBanner: homeController.homeBannerTwo,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 450,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Color(0xCCF3F3F3),
                  image: DecorationImage(
                    image: AssetImage("assets/flash.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "FLASH SALE",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        color: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Discounted Price Valid Only For",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        color: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "00h 12m 37s",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),

                    // HorizontalFlashSaleTile(
                    //     title: "Product Name",
                    //     image: "",
                    //     price: "OMR 75.000",
                    //     tab: () {},
                    //   ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.flashSail.length,
                        itemBuilder: (context, index) {
                          return HorizontalFlashSaleTile(
                            title: homeController.flashSail[index].name,
                            image: homeController.flashSail[index].image,
                            price: homeController.flashSail[index].price,
                            tab: () {},
                          );
                        },
                      ),
                    ),
                    ViewAllText(tap: () {})
                  ],
                ),
              ),
              SectionHeader(
                title: "Best of Swan",
                tab: () {},
                viewall: false,
              ),
              HomeBanner(
                homescreenBanner: homeController.homeBannerOne,
              ),
              SectionHeader(
                title: "Top Accessories",
                tab: () {},
                viewall: false,
              ),
              Container(
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: homeController.category.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .6,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      print(homeController.category.length);
                      return TrendingCategoryTile(
                        title: homeController.category[index].category.name,
                        image: homeController.category[index].category.image,
                        tab: () {},
                      );
                    }),
              ),
              SectionHeader(
                title: "Our Best Picks",
                tab: () {},
                viewall: false,
              ),
              BannerStyleThree(
                homescreenBanner: homeController.homeBannerTwo,
              ),
              SizedBox(
                height: 20,
              ),
              BannerStyleThree(
                homescreenBanner: homeController.homeBannerTwo,
              ),
              SizedBox(
                height: 20,
              ),
              BannerStyleThree(
                homescreenBanner: homeController.homeBannerTwo,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Swan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Brands',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium_sharp),
            label: 'Best Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
      ),
    );
  }
}

class ViewAllText extends StatelessWidget {
  const ViewAllText({
    super.key,
    required this.tap,
  });
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return Text(
      "View All",
      style: TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({
    super.key,
    required this.homescreenBanner,
  });

  final RxList<BannerData> homescreenBanner;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options:
          CarouselOptions(height: 240.0, viewportFraction: 1, autoPlay: true),
      items: homescreenBanner.value.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://swan.alisonsnewdemo.online/images/banner/${banner.image}",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10)),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      side: BorderSide(color: Colors.white)))),
                      onPressed: () => null,
                      child: Text("Shop Now".toUpperCase(),
                          style: const TextStyle(fontSize: 14))),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}

class BannerStyleTwo extends StatelessWidget {
  const BannerStyleTwo({
    super.key,
    required this.homescreenBanner,
  });

  final RxList<BannerData> homescreenBanner;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 1,
        autoPlay: true,
        pageSnapping: false,
      ),
      items: homescreenBanner.value.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image(
                    image: NetworkImage(
                        "https://swan.alisonsnewdemo.online/images/banner/${banner.image}"),
                    fit: BoxFit.cover,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}

class BannerStyleThree extends StatelessWidget {
  const BannerStyleThree({
    super.key,
    required this.homescreenBanner,
  });

  final RxList<BannerData> homescreenBanner;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 1,
        autoPlay: true,
        pageSnapping: false,
      ),
      items: homescreenBanner.value.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.maxFinite,
                child: Image(
                  image: NetworkImage(
                      "https://swan.alisonsnewdemo.online/images/banner/${banner.image}"),
                  fit: BoxFit.cover,
                ));
          },
        );
      }).toList(),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.homescreenBanner,
  });

  final RxList<BannerData> homescreenBanner;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options:
          CarouselOptions(height: 400.0, viewportFraction: 1, autoPlay: true),
      items: homescreenBanner.value.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    imageUrl:
                        "https://swan.alisonsnewdemo.online/images/banner/${banner.image}",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                // Positioned(
                //   bottom: 40,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     child: Column(
                //       children: [
                //         Text("SUMMER COLORS OF FURAL", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23,color: Colors.white),),
                //         Text("Float in Lightweight Summer Fits", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: Colors.white),),
                //       ],
                //     ),
                //   )
                // ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}

class HorizontalProductTile extends StatelessWidget {
  const HorizontalProductTile({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.tab, required this.product,
  });
  final String title;
  final String image;
  final String price;
  final Function tab;
  final BestSeller product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ProductDetailScreen(product: product));
      },
      child: Container(
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://swan.alisonsnewdemo.online/images/product/${image}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(price),
            ],
          )),
    );
  }
}

class HorizontalFlashSaleTile extends StatelessWidget {
  const HorizontalFlashSaleTile({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.tab,
  });
  final String title;
  final String image;
  final String price;
  final Function tab;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 10),
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          width: 140,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero),
                child: CachedNetworkImage(
                  height: 160,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://swan.alisonsnewdemo.online/images/product/${image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
                // Image.network(
                //  "https://swan.alisonsnewdemo.online/images/product/${image}",
                //   fit: BoxFit.cover,
                //   height: 160,
                // ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  price,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}

class TrendingCategoryTile extends StatelessWidget {
  const TrendingCategoryTile({
    super.key,
    required this.title,
    required this.image,
    required this.tab,
  });
  final String title;
  final String image;
  final Function tab;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                    "assets/product_img.png",
                    fit: BoxFit.cover,
                  ),
                // CachedNetworkImage(
                //   height: double.maxFinite,
                //   imageUrl:
                //       "https://swan.alisonsnewdemo.online/images/category/${image}",
                //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                //       CircularProgressIndicator(value: downloadProgress.progress),
                //   errorWidget: (context, url, error) => Image.asset(
                //     "assets/product_img.png",
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ));
  }
}

class NewArrivalProductTile extends StatelessWidget {
  const NewArrivalProductTile({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.tab,
    required this.height,
  });
  final String title;
  final String image;
  final String price;
  final Function tab;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://swan.alisonsnewdemo.online/images/product/${image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/product_img.png",
                    fit: BoxFit.cover,
                    height: height,
                    width: double.maxFinite,
                  ),
                ),
              ),
            ),
            Text(title),
            Text(price),
          ],
        ));
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.tab,
    required this.viewall,
  });
  final String title;
  final Function tab;
  final bool viewall;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          viewall == true
              ? ViewAllText(
                  tap: () {},
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class HorizontalListTile extends StatelessWidget {
  const HorizontalListTile(this.img);
  final String img;

  @override
  Widget build(BuildContext context) {
    //check the image is not null
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://swan.alisonsnewdemo.online/images/featuredbrands/${img}",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) =>
                Image(image: AssetImage("assets/brand.png")),
          ),

          // Text("data")
        ],
      ),
    );
  }
}
