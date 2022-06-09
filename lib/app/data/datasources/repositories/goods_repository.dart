import 'package:bens/app/domain/models/goods_model.dart';
import 'package:get/get.dart';

abstract class GoodsRepository {
  Future<void> list(RxList<GoodsModel> list);
  Future<String> append(GoodsModel model);
  Future<void> delete(String id);
}
