// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
    int? success;
    List<SelectedOption>? selectedOption;
    String? message;
    Product? product;
    dynamic enableGuestReview;

    ProductDetailModel({
        this.success,
        this.selectedOption,
        this.message,
        this.product,
        this.enableGuestReview,
    });

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        success: json["success"],
        selectedOption: json["selected_option"] == null ? [] : List<SelectedOption>.from(json["selected_option"]!.map((x) => SelectedOption.fromJson(x))),
        message: json["message"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        enableGuestReview: json["enable_guest_review"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "selected_option": selectedOption == null ? [] : List<dynamic>.from(selectedOption!.map((x) => x.toJson())),
        "message": message,
        "product": product?.toJson(),
        "enable_guest_review": enableGuestReview,
    };
}

class Product {
    String? slug;
    String? code;
    String? sizeChart;
    dynamic metaTitle;
    dynamic metaDescription;
    dynamic metaKeywords;
    int? parentId;
    String? name;
    String? description;
    String? appDescription;
    String? storeslug;
    String? store;
    String? manufacturer;
    String? symbolLeft;
    String? symbolRight;
    String? purchaseReward;
    String? rewardPoint;
    String? oldprice;
    String? price;
    String? discount;
    String? rating;
    int? wishlist;
    int? cart;
    int? reviewscount;
    int? ratingcount;
    String? sellerrating;
    List<dynamic>? relatedProducts;
    List<Option>? options;
    List<AllOption>? allOptions;
    List<Address>? address;
    List<Image>? images;
    List<StoreElement>? stores;
    List<dynamic>? reviews;
    List<dynamic>? specifications;
    List<AllOption>? allProductOptions;
    List<Option>? pOptions;
    List<Option>? relatedOptions;

    Product({
        this.slug,
        this.code,
        this.sizeChart,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.parentId,
        this.name,
        this.description,
        this.appDescription,
        this.storeslug,
        this.store,
        this.manufacturer,
        this.symbolLeft,
        this.symbolRight,
        this.purchaseReward,
        this.rewardPoint,
        this.oldprice,
        this.price,
        this.discount,
        this.rating,
        this.wishlist,
        this.cart,
        this.reviewscount,
        this.ratingcount,
        this.sellerrating,
        this.relatedProducts,
        this.options,
        this.allOptions,
        this.address,
        this.images,
        this.stores,
        this.reviews,
        this.specifications,
        this.allProductOptions,
        this.pOptions,
        this.relatedOptions,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        slug: json["slug"],
        code: json["code"],
        sizeChart: json["size_chart"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        parentId: json["parent_id"],
        name: json["name"],
        description: json["description"],
        appDescription: json["app_description"],
        storeslug: json["storeslug"],
        store: json["store"],
        manufacturer: json["manufacturer"],
        symbolLeft: json["symbol_left"],
        symbolRight: json["symbol_right"],
        purchaseReward: json["purchase_reward"],
        rewardPoint: json["reward_point"],
        oldprice: json["oldprice"],
        price: json["price"],
        discount: json["discount"],
        rating: json["rating"],
        wishlist: json["wishlist"],
        cart: json["cart"],
        reviewscount: json["reviewscount"],
        ratingcount: json["ratingcount"],
        sellerrating: json["sellerrating"],
        relatedProducts: json["related_products"] == null ? [] : List<dynamic>.from(json["related_products"]!.map((x) => x)),
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
        allOptions: json["all_options"] == null ? [] : List<AllOption>.from(json["all_options"]!.map((x) => AllOption.fromJson(x))),
        address: json["address"] == null ? [] : List<Address>.from(json["address"]!.map((x) => Address.fromJson(x))),
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        stores: json["stores"] == null ? [] : List<StoreElement>.from(json["stores"]!.map((x) => StoreElement.fromJson(x))),
        reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        specifications: json["specifications"] == null ? [] : List<dynamic>.from(json["specifications"]!.map((x) => x)),
        allProductOptions: json["all_product_options"] == null ? [] : List<AllOption>.from(json["all_product_options"]!.map((x) => AllOption.fromJson(x))),
        pOptions: json["p_options"] == null ? [] : List<Option>.from(json["p_options"]!.map((x) => Option.fromJson(x))),
        relatedOptions: json["related_options"] == null ? [] : List<Option>.from(json["related_options"]!.map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "code": code,
        "size_chart": sizeChart,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "parent_id": parentId,
        "name": name,
        "description": description,
        "app_description": appDescription,
        "storeslug": storeslug,
        "store": store,
        "manufacturer": manufacturer,
        "symbol_left": symbolLeft,
        "symbol_right": symbolRight,
        "purchase_reward": purchaseReward,
        "reward_point": rewardPoint,
        "oldprice": oldprice,
        "price": price,
        "discount": discount,
        "rating": rating,
        "wishlist": wishlist,
        "cart": cart,
        "reviewscount": reviewscount,
        "ratingcount": ratingcount,
        "sellerrating": sellerrating,
        "related_products": relatedProducts == null ? [] : List<dynamic>.from(relatedProducts!.map((x) => x)),
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
        "all_options": allOptions == null ? [] : List<dynamic>.from(allOptions!.map((x) => x.toJson())),
        "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x.toJson())),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "specifications": specifications == null ? [] : List<dynamic>.from(specifications!.map((x) => x)),
        "all_product_options": allProductOptions == null ? [] : List<dynamic>.from(allProductOptions!.map((x) => x.toJson())),
        "p_options": pOptions == null ? [] : List<dynamic>.from(pOptions!.map((x) => x.toJson())),
        "related_options": relatedOptions == null ? [] : List<dynamic>.from(relatedOptions!.map((x) => x.toJson())),
    };
}

class Address {
    int? id;
    int? customerId;
    String? name;
    dynamic address;
    String? buildingNumber;
    String? areaNumber;
    dynamic streetNumber;
    String? city;
    String? region;
    String? state;
    int? countryId;
    String? zipcode;
    String? mobile;
    String? addressType;
    dynamic latitude;
    dynamic longtitude;
    int? isDefault;
    DateTime? createdAt;
    DateTime? updatedAt;
    Country? country;

    Address({
        this.id,
        this.customerId,
        this.name,
        this.address,
        this.buildingNumber,
        this.areaNumber,
        this.streetNumber,
        this.city,
        this.region,
        this.state,
        this.countryId,
        this.zipcode,
        this.mobile,
        this.addressType,
        this.latitude,
        this.longtitude,
        this.isDefault,
        this.createdAt,
        this.updatedAt,
        this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        address: json["address"],
        buildingNumber: json["building_number"],
        areaNumber: json["area_number"],
        streetNumber: json["street_number"],
        city: json["city"],
        region: json["region"],
        state: json["state"],
        countryId: json["country_id"],
        zipcode: json["zipcode"],
        mobile: json["mobile"],
        addressType: json["address_type"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "address": address,
        "building_number": buildingNumber,
        "area_number": areaNumber,
        "street_number": streetNumber,
        "city": city,
        "region": region,
        "state": state,
        "country_id": countryId,
        "zipcode": zipcode,
        "mobile": mobile,
        "address_type": addressType,
        "latitude": latitude,
        "longtitude": longtitude,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "country": country?.toJson(),
    };
}

class Country {
    int? id;
    String? name;
    String? shortcode;
    int? dialCode;
    int? deliveryAvailable;
    dynamic createdAt;
    DateTime? updatedAt;

    Country({
        this.id,
        this.name,
        this.shortcode,
        this.dialCode,
        this.deliveryAvailable,
        this.createdAt,
        this.updatedAt,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        shortcode: json["shortcode"],
        dialCode: json["dial_code"],
        deliveryAvailable: json["delivery_available"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortcode": shortcode,
        "dial_code": dialCode,
        "delivery_available": deliveryAvailable,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class AllOption {
    int? optionId;
    String? name;
    int? productId;
    int? parentProductId;
    int? id;
    String? type;
    List<AllOptionValue>? values;

    AllOption({
        this.optionId,
        this.name,
        this.productId,
        this.parentProductId,
        this.id,
        this.type,
        this.values,
    });

    factory AllOption.fromJson(Map<String, dynamic> json) => AllOption(
        optionId: json["option_id"],
        name: json["name"],
        productId: json["product_id"],
        parentProductId: json["parent_product_id"],
        id: json["id"],
        type: json["type"],
        values: json["values"] == null ? [] : List<AllOptionValue>.from(json["values"]!.map((x) => AllOptionValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "option_id": optionId,
        "name": name,
        "product_id": productId,
        "parent_product_id": parentProductId,
        "id": id,
        "type": type,
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
    };
}

class AllOptionValue {
    int? optionValueId;
    String? value;
    String? text;
    int? productOptionId;
    int? srtOrder;
    int? stock;

    AllOptionValue({
        this.optionValueId,
        this.value,
        this.text,
        this.productOptionId,
        this.srtOrder,
        this.stock,
    });

    factory AllOptionValue.fromJson(Map<String, dynamic> json) => AllOptionValue(
        optionValueId: json["option_value_id"],
        value: json["value"],
        text: json["text"],
        productOptionId: json["product_option_id"],
        srtOrder: json["srt_order"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "option_value_id": optionValueId,
        "value": value,
        "text": text,
        "product_option_id": productOptionId,
        "srt_order": srtOrder,
        "stock": stock,
    };
}

class Image {
    int? id;
    String? image;
    int? isDefault;

    Image({
        this.id,
        this.image,
        this.isDefault,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        isDefault: json["is_default"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "is_default": isDefault,
    };
}

class Option {
    int? id;
    int? productId;
    int? parentProductId;
    int? optionId;
    int? isVarient;
    int? order;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<OptionValue>? values;

    Option({
        this.id,
        this.productId,
        this.parentProductId,
        this.optionId,
        this.isVarient,
        this.order,
        this.createdAt,
        this.updatedAt,
        this.values,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        parentProductId: json["parent_product_id"],
        optionId: json["option_id"],
        isVarient: json["is_varient"],
        order: json["order"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        values: json["values"] == null ? [] : List<OptionValue>.from(json["values"]!.map((x) => OptionValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "parent_product_id": parentProductId,
        "option_id": optionId,
        "is_varient": isVarient,
        "order": order,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
    };
}

class OptionValue {
    int? id;
    int? productOptionId;
    int? productId;
    int? parentProductId;
    int? optionValueId;
    DateTime? createdAt;
    DateTime? updatedAt;

    OptionValue({
        this.id,
        this.productOptionId,
        this.productId,
        this.parentProductId,
        this.optionValueId,
        this.createdAt,
        this.updatedAt,
    });

    factory OptionValue.fromJson(Map<String, dynamic> json) => OptionValue(
        id: json["id"],
        productOptionId: json["product_option_id"],
        productId: json["product_id"],
        parentProductId: json["parent_product_id"],
        optionValueId: json["option_value_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_option_id": productOptionId,
        "product_id": productId,
        "parent_product_id": parentProductId,
        "option_value_id": optionValueId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class StoreElement {
    int? id;
    int? productId;
    int? storeId;
    String? defaultPrice;
    String? stock;
    String? minQuantity;
    String? maxQuantity;
    String? currentPrice;
    String? cost;
    int? returnPeriod;
    int? status;
    String? commission;
    int? stockAlertQuantity;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? price;
    String? rating;
    StoreStore? store;

    StoreElement({
        this.id,
        this.productId,
        this.storeId,
        this.defaultPrice,
        this.stock,
        this.minQuantity,
        this.maxQuantity,
        this.currentPrice,
        this.cost,
        this.returnPeriod,
        this.status,
        this.commission,
        this.stockAlertQuantity,
        this.createdAt,
        this.updatedAt,
        this.price,
        this.rating,
        this.store,
    });

    factory StoreElement.fromJson(Map<String, dynamic> json) => StoreElement(
        id: json["id"],
        productId: json["product_id"],
        storeId: json["store_id"],
        defaultPrice: json["default_price"],
        stock: json["stock"],
        minQuantity: json["min_quantity"],
        maxQuantity: json["max_quantity"],
        currentPrice: json["current_price"],
        cost: json["cost"],
        returnPeriod: json["return_period"],
        status: json["status"],
        commission: json["commission"],
        stockAlertQuantity: json["stock_alert_quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        price: json["price"],
        rating: json["rating"],
        store: json["store"] == null ? null : StoreStore.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "store_id": storeId,
        "default_price": defaultPrice,
        "stock": stock,
        "min_quantity": minQuantity,
        "max_quantity": maxQuantity,
        "current_price": currentPrice,
        "cost": cost,
        "return_period": returnPeriod,
        "status": status,
        "commission": commission,
        "stock_alert_quantity": stockAlertQuantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "price": price,
        "rating": rating,
        "store": store?.toJson(),
    };
}

class StoreStore {
    int? id;
    String? name;
    String? address;
    String? slug;
    String? latitude;
    String? longtitude;
    String? image;
    String? phoneNumber;

    StoreStore({
        this.id,
        this.name,
        this.address,
        this.slug,
        this.latitude,
        this.longtitude,
        this.image,
        this.phoneNumber,
    });

    factory StoreStore.fromJson(Map<String, dynamic> json) => StoreStore(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        slug: json["slug"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        image: json["image"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "slug": slug,
        "latitude": latitude,
        "longtitude": longtitude,
        "image": image,
        "phone_number": phoneNumber,
    };
}

class SelectedOption {
    int? optionValueId;
    int? optionId;

    SelectedOption({
        this.optionValueId,
        this.optionId,
    });

    factory SelectedOption.fromJson(Map<String, dynamic> json) => SelectedOption(
        optionValueId: json["option_value_id"],
        optionId: json["option_id"],
    );

    Map<String, dynamic> toJson() => {
        "option_value_id": optionValueId,
        "option_id": optionId,
    };
}
