import 'package:bens/app/data/datasources/back4app/goods/goods_repository_b4a.dart';
import 'package:bens/app/domain/usecases/goods/goods_usecase.dart';
import 'package:bens/app/domain/usecases/goods/goods_usecase_impl.dart';
import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:get/get.dart';
import 'package:bens/app/data/datasources/repositories/goods_repository.dart';

class GoodsDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoodsRepository>(
      () => GoodsRepositoryB4a(),
    );
    Get.lazyPut<GoodsUseCase>(
      () => GoodsUseCaseImpl(
        repository: Get.find(),
      ),
    );
    Get.lazyPut<GoodsController>(
        () => GoodsController(goodsUseCase: Get.find()));
  }
}
