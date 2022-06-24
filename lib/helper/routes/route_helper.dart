import 'package:food_apps/pages/food/popular_food_details.dart';
import 'package:food_apps/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../../pages/food/recommended_food_detail.dart';

class RouteHelper {
  //of course there is routes register for it
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  //best way to justify the parameter is actual indicate the specific route
  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  //if we need to put and int into a string we use that way
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageIdd = Get.parameters['pageId'];
          return PopularFoodDetail(
              //jodi konovabei null exception handle na hoy tahole bujhte hbe variable samne howar karone ei problem hocche.
              pageId: int.parse(pageIdd!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageIdd = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageIdd!));
        },
        transition: Transition.fadeIn),
  ];
}
