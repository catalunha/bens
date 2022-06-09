import 'package:bens/app/domain/models/goods_model.dart';
import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bens/app/presentation/views/utils/app_launch.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
              Row(
                children: [
                  QrImage(
                    data: goods.id!,
                    version: QrVersions.auto,
                    size: 100.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(goods.id!),
                      Text(goods.name),
                      Text(goods.ownership),
                      Text(goods.room),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: goods.image != null
                        ? Image.network(
                            // 'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/0b28345ecb39e2177d1746f80246ed70_woman2.png',
                            goods.image!,
                            height: 90,
                            width: 90,
                            errorBuilder: (_, __, ___) {
                              return const Icon(
                                Icons.person,
                                color: Colors.black,
                              );
                            },
                          )
                        : const Icon(Icons.chair),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          goods.description,
                          softWrap: true,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text('Volume X: ${goods.volumeX} mm'),
                      Text('Volume Y: ${goods.volumeY} mm'),
                      Text('Volume Z: ${goods.volumeZ} mm'),
                      Text('Peso: ${goods.weight} g'),
                    ],
                  )
                ],
              ),
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
