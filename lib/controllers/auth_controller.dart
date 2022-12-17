import 'package:food_apps/models/signup_body_model.dart';
import 'package:get/get.dart';

import '../data/repositories/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  get isLoading => _isLoading;

  registration(SignupBody signupBody) async {
    _isLoading = true;
    Response response = await authRepo.registration(signupBody);
    if (response.statusCode == 200) {
      authRepo.saveToken(response.body["token"]);
    } else {}
  }
}
