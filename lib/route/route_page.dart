import 'package:commission_art_app2/pages/login.dart';
import 'package:commission_art_app2/home/home_screen/main_home_page.dart';
import 'package:commission_art_app2/pages/orderPage.dart';
import 'package:commission_art_app2/pages/signup.dart';
import 'package:commission_art_app2/route/route_name.dart';
import 'package:commission_art_app2/detail/screen/detail_screen.dart';
import 'package:commission_art_app2/screens/splash.dart';
import 'package:commission_art_app2/search/bindings/search_binding.dart';
import 'package:commission_art_app2/search/screen/search_screen.dart';
import 'package:get/get.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.detailScreen,
      page: () => DetailScreen(
        productId: '',
      ),
    ),
    GetPage(name: RouteName.SplashScreen, page: () => SplashScreen()),
    GetPage(name: RouteName.LoginPage, page: () => LoginPage()),
    GetPage(name: RouteName.SignUpPage, page: () => SignUpPage()),
    GetPage(name: RouteName.HomePage, page: () => HomePage()),
    GetPage(name: RouteName.OrderPage, page: () => OrderPage()),
    GetPage(
      name: RouteName.SearchScreen,
      page: () => SearchScreen(),
      binding: SearchBinding(), // Menambahkan binding di sini
    ),
  ];
}
