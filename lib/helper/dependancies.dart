import 'package:food_apps/controllers/auth_controller.dart';
import 'package:food_apps/controllers/cart_controller.dart';
import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/controllers/recommended_product_controller.dart';
import 'package:food_apps/data/api/api_client.dart';
import 'package:food_apps/data/repositories/cart_repo.dart';
import 'package:food_apps/data/repositories/popular_product_repo.dart';
import 'package:food_apps/data/repositories/recommended_product_repo.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/auth_repo.dart';

Future<void> init() async {
  //local storage
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  //repos are dedicated to get and store data from anywhere.
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

  //jokhn cart korbo add korar por oisomoy cart er value dhorbo kmne??
  //lazyPut memory efficiency baray.
}
