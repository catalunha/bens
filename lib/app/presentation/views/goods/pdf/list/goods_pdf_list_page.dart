import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoodsPdfListPage extends StatelessWidget {
  final GoodsController _goodsController = Get.find();

  GoodsPdfListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      // body: GoodsPdfList(
      //   goodsList: _goodsController.goodsList,
      // ),
    );
  }
}
