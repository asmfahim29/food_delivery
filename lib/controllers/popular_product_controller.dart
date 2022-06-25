import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../data/repositories/popular_product_repo.dart';

class PopularProductController extends GetxController {
  //create class object or instance.
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  //for giving a loading indicator
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  //we can also write this way
  // bool get isLoaded{
  //   return _isLoaded;
  // }

  //fetching data from model class
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got Products");

      _popularProductList = [];

      //we need to get the data from json model to convert the json.
      _popularProductList.addAll(Product.fromJson(response.body).products);

      //we need to call update method it works as a setState((){})
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("No product found");
    }
  }

  int _quantity = 0;
  int get quantity => _quantity;

  //basic function for increasing or decreasing quantity of a cart item
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      //increase the quantity
      _quantity = checkQuantity(_quantity + 1);
      print("increment  ${_quantity}");
    } else {
      //decrease quantity
      _quantity = checkQuantity(_quantity - 1);
      print("decrement  ${_quantity}");
    }
    update();
  }

  //for checking less then 0 or more then limits
  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Item count",
        "you can't reduce more!",
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Item count",
        "you can't add more!",
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  //responsible for checking the current things
  void initProduct() {
    _quantity = 0;
  }
}
