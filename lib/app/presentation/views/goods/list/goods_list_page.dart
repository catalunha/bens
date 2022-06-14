import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:bens/app/presentation/views/goods/list/parts/goods_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bens/app/presentation/views/utils/app_appbar.dart';

class GoodsListPage extends StatelessWidget {
  final GoodsController _goodsController = Get.find();
  GoodsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Bens do CEMEC'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.search),
            trailing: Obx(() => Text('${_goodsController.goodsSearch.length}')),
            title: TextField(
              decoration: const InputDecoration(
                labelText: 'Digite o nome de um bem',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                _goodsController.onGoodsSearch(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => _goodsController.goodsSearch.isNotEmpty
                  ? Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SizedBox(
                          height: 200,
                          child: GoodsList(
                            goodsList: _goodsController.goodsSearch,
                          ),
                        ),
                      ),
                    )
                  : GoodsList(
                      goodsList: _goodsController.goodsList,
                    ),
            ),
          ),
          // Expanded(
          //   child: Obx(
          //     () => GoodsList(
          //       milestones: _goodsController.milestones,
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goodsController.add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
