import 'package:get/get.dart';

import '../data/repositaries/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      //we need to get the data from json model to convert the json.
      //_popularProductList.addAll();
      //we need to call update method it works as a setState((){})
      update();
    }
  }
}
