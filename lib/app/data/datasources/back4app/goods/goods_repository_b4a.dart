import 'package:bens/app/data/datasources/back4app/entity/goods_entity.dart';
import 'package:bens/app/data/datasources/back4app/goods/goods_repository_exception.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:bens/app/data/datasources/repositories/goods_repository.dart';
import 'package:bens/app/domain/models/goods_model.dart';

class GoodsRepositoryB4a extends GetxService implements GoodsRepository {
  Future<QueryBuilder<ParseObject>> getQuery() async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(GoodsEntity.className));
    query.orderByAscending('name');
    query.includeObject(['user', 'user.profile']);
    return query;
  }

  @override
  Future<void> list(RxList<GoodsModel> list) async {
    final query = await getQuery();

    final ParseResponse response = await query.query();
    if (response.success && response.results != null) {
      list.clear();
      for (var element in response.results!) {
        print((element as ParseObject).objectId);
        list.add(GoodsEntity().fromParse(element));
      }
    } else {
      print('Sem Goodss...');
    }
  }

  @override
  Future<String> append(GoodsModel model) async {
    final parseObject = await GoodsEntity().toParse(model);
    final ParseResponse parseResponse = await parseObject.save();
    if (parseResponse.success && parseResponse.results != null) {
      ParseObject userProfile = parseResponse.results!.first as ParseObject;
      return userProfile.objectId!;
    } else {
      throw GoodsRepositoryException(
          code: 1, message: 'Não foi possivel cadastrar/atualizar o bem.');
    }
  }

  @override
  Future<void> delete(String id) async {
    var parseObject = ParseObject(GoodsEntity.className)..objectId = id;
    await parseObject.delete();
  }
}
