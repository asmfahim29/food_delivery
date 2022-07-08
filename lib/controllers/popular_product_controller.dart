import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/cart_controller.dart';
import 'package:food_apps/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../data/repositories/popular_product_repo.dart';

class PopularProductController extends GetxController {
  //create class object or instance.
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  //for giving a loading indicator
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  //we can also write this way
  // bool get isLoaded{
  //   return _isLoaded;}

  //fetching data from model class
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];

      //we need to get the data from json model to convert the json.
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      //we need to call update method it works as a setState((){})
      update();
    } else {
      debugPrint("No product found");
    }
  }

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + quantity;

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
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "you can't reduce more!",
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
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
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not: $exist");
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("The quantity in the cart is: $_inCartItems");
    //if exist something in the storage already or not
    //get from storage set it to _inCartItems
  }

  //to fetch data from cartController
  void addItem(ProductModel product) {
    // if (quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The id is ${value.id},The quantity is ${value.quantity}");
    });
    /* } else {
      Get.snackbar(
        "Item Count",
        "You did not add any items",
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }*/
  }
}
