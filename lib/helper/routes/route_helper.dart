import 'package:food_apps/pages/cart/cart_page.dart';
import 'package:food_apps/pages/food/popular_food_details.dart';
import 'package:food_apps/pages/home/home_page.dart';
import 'package:food_apps/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../../pages/food/recommended_food_detail.dart';

class RouteHelper {
  //of course there is routes register for it
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart_page";

  //best way to justify the parameter is actual indicate the specific route
  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String pPage) =>
      '$popularFood?pageId=$pageId&pPage=$pPage';
  //if we need to put and int into a string we use that way
  static String getRecommendedFood(int pageId, String rPage) =>
      '$recommendedFood?pageId=$pageId&rPage=$rPage';
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageIdd = Get.parameters['pageId'];
          var pPage = Get.parameters["pPage"];
          return PopularFoodDetail(
              //jodi konovabei null exception handle na hoy
              // tahole bujhte hbe variable samne howar karone ei problem hocche.
              pageId: int.parse(pageIdd!),
              pPage: pPage!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageIdd = Get.parameters['pageId'];
          var rPage = Get.parameters["rPage"];
          return RecommendedFoodDetail(
              pageId: int.parse(pageIdd!), rPage: rPage!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
