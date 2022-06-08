import 'package:bens/app/domain/models/goods_model.dart';
import 'package:get/get.dart';

abstract class GoodsRepository {
  Future<void> list(RxList<GoodsModel> list);
  Future<void> create(GoodsModel model);
  Future<void> update(GoodsModel model);
  Future<void> delete(String id);
}
