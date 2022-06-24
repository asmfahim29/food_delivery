import 'package:food_apps/utils/ap_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  //this is the object or instance of apiClient class
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    //we have to create this url
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
