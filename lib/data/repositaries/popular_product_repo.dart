import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    //we have to create this url
    return await apiClient.getData("http://www.dbstech.com/api/product/list");
  }
}
