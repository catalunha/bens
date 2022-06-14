import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:bens/app/presentation/views/goods/list/parts/goods_info.dart';
import 'package:bens/app/presentation/views/utils/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoodsScannedPage extends StatelessWidget {
  final GoodsController _goodsController = Get.find();

  GoodsScannedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Bem Identificado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _goodsController.goods == null
              ? const Text('Não encontrei nenhum bem.')
              : GoodsInfo(
                  goods: _goodsController.goods!,
                )
        ],
      ),
    );
  }
}
