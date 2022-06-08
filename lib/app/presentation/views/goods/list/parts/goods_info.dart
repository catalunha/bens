import 'package:bens/app/domain/models/goods_model.dart';
import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bens/app/presentation/views/utils/app_launch.dart';

class GoodsInfo extends StatelessWidget {
  final GoodsController _goodsController = Get.find();

  final GoodsModel goods;
  GoodsInfo({Key? key, required this.goods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goodsController.edit(goods.id!);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(goods.name),
              IconButton(
                onPressed: () => AppLaunch.launchGoogleMaps(
                    goods.latitude!, goods.longitude!),
                icon: const Icon(Icons.location_on),
              )
            ],
          ),
        ),
      ),
    );
  }
}
