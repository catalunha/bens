import 'package:get/get.dart';
import 'package:bens/app/presentation/controllers/home/home_controller.dart';

class HomeDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(authUseCase: Get.find()),
    );
  }
}
