import 'package:get/get.dart';
import 'package:pegawai/page/list_user_page.dart';
import 'package:pegawai/route/route_name.dart';

class PagesRoute {
  static final pages = [
    GetPage(name: RouteName.user, page: ()=> ListUserPage()),
  ];
}