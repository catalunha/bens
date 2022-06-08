import 'package:get/get.dart';
import 'package:bens/app/domain/models/goods_model.dart';

abstract class GoodsUseCase {
  Future<void> create(GoodsModel model);
  Future<void> list(RxList<GoodsModel> list);
  Future<void> update(GoodsModel model);
  Future<void> delete(String id);
}
