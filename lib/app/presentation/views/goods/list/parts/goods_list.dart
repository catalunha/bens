import 'package:bens/app/presentation/views/goods/list/parts/goods_info.dart';
import 'package:flutter/material.dart';
import 'package:bens/app/domain/models/goods_model.dart';

class GoodsList extends StatelessWidget {
  final List<GoodsModel> goodsList;
  const GoodsList({
    Key? key,
    required this.goodsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: goodsList.length,
      itemBuilder: (context, index) {
        final goods = goodsList[index];
        return GoodsInfo(goods: goods);
      },
    );
  }
}
