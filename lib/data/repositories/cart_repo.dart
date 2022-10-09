import 'dart:convert';

import 'package:food_apps/utils/ap_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    //sharedPreferences.remove(AppConstants.CART_LIST);(Only for checking if the process is ok or not)
    cart = [];
    /*
    convert objects to String cz sharedPrefs only accepts String value
    */
    /*
      cartList.forEach((element) {
      cart.add(jsonEncode(element));
    });*/
    //fancy way of decoding
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    // string akare sharedPref kaj kore, data save kore
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(
    //     "Saved Value to SHaredPref : ${sharedPreferences.getStringList(AppConstants.CART_LIST)}");

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside getCartList ${carts.toString()}");
    }
    List<CartModel> cartList = [];
    /*
    List<Object> list =[
    "Object1"
    "Object2"
    "Object3"
    ];
    */

    /* formal way of decoding
       carts.forEach((element) {
       cartList.add(CartModel.fromJson(jsonDecode(element)));
    });*/
    //fancy way of decoding
    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }


  //List of cart history, persistent to history screen in home page until the user logs out
  List<String> cartHistory = [];
  void addToCartHistoryList(){
    for(int i = 0; i < cart.length; i++){
      cartHistory.add(cart[i]);
      print("Cart history = ${cart[i]}");
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }
  void removeCart(){
    sharedPreferences.remove(AppConstants.CART_LIST);
  }


}
