import 'package:food_apps/utils/ap_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    //in future we need to change thi token but for now we just initialize it.
    token = AppConstants.TOKEN;
    _mainHeaders = {
      //headers
      'Content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(
          uri); // get(uri) only want the endpoint of the api, not the full.
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
