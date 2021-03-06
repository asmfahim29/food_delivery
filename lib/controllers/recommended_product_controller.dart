import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/repositories/recommended_product_repo.dart';
import '../models/popular_products_model.dart';

class RecommendedProductController extends GetxController {
  //create class object or instance.
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];

      //we need to get the data from json model to convert the json.
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;

      //we need to call update method it works as a setState((){})
      update();
    } else {
      debugPrint("Couldn't get Recommended Products");
    }
  }
}
