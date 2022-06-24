import 'package:food_apps/data/api/api_client.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMANDED_PRODUCT_URI);
  }
}
