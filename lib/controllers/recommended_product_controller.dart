import 'package:food_apps/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../data/repositories/popular_product_repo.dart';

class RecommendedProductController extends GetxController {
  //create class object or instance.
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  Future<void> getPopularProductList() async {
    Response response = await recommendedProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got Products");

      _recommendedProductList = [];
      print("---------------------------------");

      //we need to get the data from json model to convert the json.
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print("---------------------------------");

      //we need to call update method it works as a setState((){})
      print(_recommendedProductList);
      _isLoaded = true;
      update();
    } else {
      print("No product found");
    }
  }
}
