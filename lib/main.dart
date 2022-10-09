import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/cart_controller.dart';
import 'package:food_apps/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/popular_product_controller.dart';
import 'helper/dependancies.dart' as dep;
import 'helper/routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    /*//if we don't have this the local storage information will gone after restarting the application
    Get.find<CartController>().getCartData();
    */
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetBuilder<CartController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food Delivery App',
            theme: ThemeData(
              textTheme: GoogleFonts.asulTextTheme(
                Theme.of(context).textTheme.apply(
                      bodyColor: AppColor.mainColor,
                      displayColor: AppColor.mainColor,
                    ),
              ),
            ),
            //home: const SplashScreen(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        });
      });
    });
  }
}
