import 'package:flutter/material.dart';
import 'package:food_apps/data/repositories/cart_repo.dart';
import 'package:food_apps/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  //everything will store over _items={};
  // save information as map
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  //added product to the cart
  void addItem(ProductModel product, int quantity) {
    //for updating items
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id!,
            name: value.name!,
            price: value.price!,
            img: value.img!,
            quantity: value.quantity! +
                quantity, //update the quantity by adding the new one in this way.
            isExist: true,
            time: DateTime.now().toString());
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        //kotobar ami product a add korsi setar length ber korbo
        //print("length of the item is ${_items.length}");
        _items.putIfAbsent(product.id!, () {
          // print(
          //     "Adding items to the cart id ${product.id!} \nnew quantity is:$quantity");
          // //for each value how much quantity I clicked
          // _items.forEach((key, value) {
          //   print("previously added quantity is: ${value.quantity.toString()}");
          // });
          return CartModel(
              id: product.id!,
              name: product.name!,
              price: product.price!,
              img: product.img!,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString());
        });
      } else {
        Get.snackbar(
          "Item Count",
          "You did not add any items",
          backgroundColor: AppColor.mainColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  //if product already exist or not
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  //get the existing quantity
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  //to show items in cartIcons
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
      //totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  //this function  would return all the cart objects that stored over items => _items.
  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
}
