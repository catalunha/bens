import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bens/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:bens/app/presentation/controllers/home/home_controller.dart';
import 'package:bens/app/presentation/views/home/parts/popmenu_user.dart';
import 'package:bens/app/presentation/views/utils/app_appbar.dart';
import 'package:bens/app/presentation/views/utils/app_assets.dart';
import 'package:bens/app/routes.dart';
import 'package:scan/scan.dart';

class HomePage extends StatefulWidget {
  final SplashController _splashController = Get.find();
  final HomeController _homeController = Get.find();

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppAppbar(
          title: appBarTitle(),
          actions: [
            PopMenuButtonPhotoUser(),
          ],
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              itemGrid(
                image: AppAssets.logo,
                text: 'Bens',
                onTap: () {
                  print('click');
                  Get.toNamed(Routes.goodsList);
                },
              ),
              itemGrid(
                image: AppAssets.logo,
                text: 'Itens List',
                onTap: () {
                  print('click');
                  Get.toNamed(Routes.goodsPdfList);
                },
              ),
              itemGrid(
                image: AppAssets.logo,
                text: 'QrCode List',
                onTap: () {
                  print('click');
                  Get.toNamed(Routes.goodsQRCodeList);
                },
              ),
              kIsWeb
                  ? itemGrid(
                      image: AppAssets.qrcode,
                      text: 'Scanner desabilitado.',
                      onTap: () {
                        print('click');
                        // Get.toNamed(Routes.goodsScan);
                      },
                    )
                  : itemGrid(
                      image: AppAssets.qrcode,
                      text: 'ScanCode',
                      onTap: () {
                        print('click');
                        Get.toNamed(Routes.goodsScan);
                      },
                    ),
            ],
          ),
        )
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Card(
        //         child: ListTile(
        //           title: const Text(
        //             'Gerenciar meus marcos',
        //           ),
        //           onTap: () => Get.toNamed(Routes.milestoneList,
        //               arguments: 'myMilestones'),
        //         ),
        //       ),
        //       Card(
        //         child: ListTile(
        //           title: const Text(
        //             'Visualizar outros marcos',
        //           ),
        //           onTap: () => Get.toNamed(Routes.milestoneOthersList,
        //               arguments: 'OthersMilestones'),
        //         ),
        //       ),
        //       Card(
        //         child: ListTile(
        //           title: const Text(
        //             'Comparar marcos',
        //           ),
        //           onTap: () => Get.toNamed(Routes.milestoneEqualsList,
        //               arguments: 'EqualsMilestones'),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

  Widget appBarTitle() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem vindo(a),',
              style: TextStyle(fontSize: 12),
            ),
            Text(widget._splashController.userModel?.profile?.nickname == null
                ? "Atualize seu perfil."
                : widget._splashController.userModel!.profile!.nickname!),
          ],
        ));
  }

  Container itemGrid(
      {required String image, required String text, Function()? onTap}) {
    return Container(
      width: 200, //WEB=300,
      height: 200,
      // padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.amberAccent,

        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   bottomLeft: Radius.circular(20),
        // ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            //   image,
            //   width: 120,
            //   height: 120,
            //   fit: BoxFit.cover,
            // ),
            Image.asset(
              image,
              height: 150,
              width: 125,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              // style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
