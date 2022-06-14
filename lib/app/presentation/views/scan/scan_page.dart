import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatelessWidget {
  ScanController controller = ScanController();
  final GoodsController _goodsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ScanView(
              controller: controller,
              scanAreaScale: .7,
              scanLineColor: Colors.green,
              onCapture: (data) {
                controller.resume();
                _goodsController.scanned(data);
              },
            ),
            Positioned(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text("Lanterna"),
                    onPressed: () {
                      controller.toggleTorchMode();
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Parar Scan"),
                    onPressed: () {
                      controller.pause();
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Ligar Scan"),
                    onPressed: () {
                      controller.resume();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
