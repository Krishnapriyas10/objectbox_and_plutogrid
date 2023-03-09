import 'package:get/get.dart';

import 'package:boxproject1/app/modules/database/bindings/database_binding.dart';
import 'package:boxproject1/app/modules/database/views/database_view.dart';
import 'package:boxproject1/app/modules/home/bindings/home_binding.dart';
import 'package:boxproject1/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DATABASE,
      page: () => DatabaseView(),
      binding: DatabaseBinding(),
    ),
  ];
}
