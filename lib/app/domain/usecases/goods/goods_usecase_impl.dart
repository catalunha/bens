import 'package:bens/app/domain/usecases/goods/goods_usecase.dart';
import 'package:get/get.dart';
import 'package:bens/app/data/datasources/repositories/goods_repository.dart';
import 'package:bens/app/domain/models/goods_model.dart';

class GoodsUseCaseImpl implements GoodsUseCase {
  final GoodsRepository _repository;
  GoodsUseCaseImpl({
    required GoodsRepository repository,
  }) : _repository = repository;
  @override
  Future<String> append(GoodsModel model) => _repository.append(model);

  @override
  Future<void> delete(String id) => _repository.delete(id);

  @override
  Future<void> list(RxList<GoodsModel> list) => _repository.list(list);
}
