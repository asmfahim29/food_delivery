import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/data/api/api_client.dart';
import 'package:food_apps/data/repositaries/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://www.dbstech.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
