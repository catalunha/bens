import 'package:bens/app/data/datasources/back4app/entity/goods_entity.dart';
import 'package:bens/app/data/datasources/back4app/goods/goods_repository_exception.dart';
import 'package:bens/app/domain/models/user_model.dart';
import 'package:bens/app/domain/usecases/goods/goods_usecase.dart';
import 'package:bens/app/domain/utils/xfile_to_parsefile.dart';
import 'package:get/get.dart';
import 'package:bens/app/domain/models/goods_model.dart';
import 'package:bens/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:bens/app/presentation/controllers/utils/mixins/loader_mixin.dart';
import 'package:bens/app/presentation/controllers/utils/mixins/message_mixin.dart';
import 'package:bens/app/routes.dart';
import 'package:image_picker/image_picker.dart';

class GoodsController extends GetxController with LoaderMixin, MessageMixin {
  final GoodsUseCase _goodsUseCase;
  GoodsController({required GoodsUseCase goodsUseCase})
      : _goodsUseCase = goodsUseCase;

  final _loading = false.obs;
  set loading(bool value) => _loading(value);
  final _message = Rxn<MessageModel>();

  final _goodsList = <GoodsModel>[].obs;
  List<GoodsModel> get goodss => _goodsList.toList();

  final _goods = Rxn<GoodsModel>();
  GoodsModel? get goods => _goods.value;

  final _goodsSearchList = <GoodsModel>[].obs;
  List<GoodsModel> get goodsSearch => _goodsSearchList.toList();

  XFile? xfile;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    list();
    super.onInit();
  }

  Future<void> list() async {
    _goodsList.clear();
    await _goodsUseCase.list(_goodsList);
  }

  Future<void> append({
    required String name,
    required String description,
    required String ownership,
    required String room,
    num? volumeX,
    num? volumeY,
    num? volumeZ,
    num? weight,
    num? latitude,
    num? longitude,
  }) async {
    try {
      _loading(true);
      UserModel userModel;
      String? modelId;
      if (goods == null) {
        SplashController splashController = Get.find();
        userModel = splashController.userModel!;
      } else {
        userModel = goods!.user;
        modelId = goods!.id;
      }
      GoodsModel model = GoodsModel(
        id: modelId,
        user: userModel,
        name: name,
        description: description,
        ownership: ownership,
        room: room,
        volumeX: volumeX,
        volumeY: volumeY,
        volumeZ: volumeZ,
        weight: weight,
        latitude: latitude,
        longitude: longitude,
      );
      modelId = await _goodsUseCase.append(model);
      if (xfile != null) {
        await XFileToParseFile.xFileToParseFile(
          xfile: xfile!,
          className: GoodsEntity.className,
          objectId: modelId,
          objectAttribute: 'image',
        );
      }
    } on GoodsRepositoryException {
      _message.value = MessageModel(
        title: 'Erro em Repository',
        message: 'Nao foi possivel salvar os dados',
        isError: true,
      );
    } finally {
      list();
      _loading(false);
    }
  }

  void add() {
    print('add');
    _goods.value = null;
    Get.toNamed(Routes.goodsAppend);
  }

  void edit(String id) {
    print('goodsCurrent: $id');
    var goodsTemp = goodss.firstWhere((element) => element.id == id);
    _goods(goodsTemp);
    Get.toNamed(Routes.goodsAppend);
  }

  Future<void> delete(String id) async {
    await _goodsUseCase.delete(id);
    Get.back();
  }

  onGoodsSearch(String value) async {
    print('onGoodsSearch $value');
    if (value.isEmpty) {
      _goodsSearchList.clear();
    } else {
      _goodsSearchList.clear();
      _goodsSearchList
          .addAll([..._goodsList.where((item) => item.name.contains(value))]);
    }
  }
}
