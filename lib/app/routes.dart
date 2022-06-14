import 'package:bens/app/presentation/controllers/goods/goods_dependencies.dart';
import 'package:bens/app/presentation/views/goods/append/goods_append_page.dart';
import 'package:bens/app/presentation/views/goods/list/goods_list_page.dart';
import 'package:bens/app/presentation/views/goods/pdf/list/parts/goods_pdf_list.dart';
import 'package:bens/app/presentation/views/goods/scanned/goods_scanned_page.dart';
import 'package:bens/app/presentation/views/scan/scan_page.dart';
import 'package:get/get.dart';
import 'package:bens/app/presentation/controllers/auth/email/auth_register_email_dependencies.dart';
import 'package:bens/app/presentation/controllers/auth/login/login_dependencies.dart';
import 'package:bens/app/presentation/controllers/auth/splash/splash_dependencies.dart';
import 'package:bens/app/presentation/controllers/home/home_dependencies.dart';
import 'package:bens/app/presentation/controllers/user/profile/user_profile_dependencies.dart';
import 'package:bens/app/presentation/views/auth/login/auth_login_page.dart';
import 'package:bens/app/presentation/views/auth/register/email/auth_register_email.page.dart';
import 'package:bens/app/presentation/views/auth/splash/splash_page.dart';
import 'package:bens/app/presentation/views/home/home_page.dart';
import 'package:bens/app/presentation/views/user/profile/user_profile_page.dart';

class Routes {
  static const splash = '/';

  static const authLogin = '/auth/login';
  static const authRegisterEmail = '/auth/register/email';

  static const home = '/home';
  static const userProfile = '/user/profile';

  static const goodsList = '/goods/list';
  static const goodsAppend = '/goods/append';
  static const goodsScan = '/goods/scan';
  static const goodsScanned = '/goods/scanned';
  static const goodsPdfList = '/goods/pdf/list';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: SplashDependencies(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.authLogin,
      binding: AuthLoginDependencies(),
      page: () => AuthLoginPage(),
    ),
    GetPage(
      name: Routes.authRegisterEmail,
      binding: AuthRegisterEmailDependencies(),
      page: () => AuthRegisterEmailPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeDependencies(),
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.userProfile,
      binding: UserProfileDependencies(),
      page: () => UserProfilePage(),
    ),
    GetPage(
      name: Routes.goodsList,
      binding: GoodsDependencies(),
      page: () => GoodsListPage(),
    ),
    GetPage(
      name: Routes.goodsAppend,
      page: () => GoodsAppendPage(),
    ),
    GetPage(
      name: Routes.goodsScan,
      binding: GoodsDependencies(),
      page: () => ScanPage(),
    ),
    GetPage(
      name: Routes.goodsScanned,
      page: () => GoodsScannedPage(),
    ),
    GetPage(
      name: Routes.goodsPdfList,
      binding: GoodsDependencies(),
      page: () => GoodsPdfList(),
    ),
  ];
}
