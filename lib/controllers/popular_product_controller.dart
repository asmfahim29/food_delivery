import 'package:food_apps/models/popular_products_model.dart';
import 'package:get/get.dart';

import '../data/repositories/popular_product_repo.dart';

class PopularProductController extends GetxController {
  //create class object or instance.
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got Products");

      _popularProductList = [];

      //we need to get the data from json model to convert the json.
      _popularProductList.addAll(Product.fromJson(response.body).products);

      //we need to call update method it works as a setState((){})
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("No product found");
    }
  }
}
