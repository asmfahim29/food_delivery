import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/controllers/recommended_product_controller.dart';
import 'package:food_apps/data/api/api_client.dart';
import 'package:food_apps/data/repositories/popular_product_repo.dart';
import 'package:food_apps/data/repositories/recommended_product_repo.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
