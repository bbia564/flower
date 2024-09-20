import 'package:flower_order/db_order/db_order.dart';
import 'package:flower_order/pages/order_add/order_add_binding.dart';
import 'package:flower_order/pages/order_add/order_add_view.dart';
import 'package:flower_order/pages/order_first/order_first_binding.dart';
import 'package:flower_order/pages/order_first/order_first_view.dart';
import 'package:flower_order/pages/order_second/order_list/order_list_binding.dart';
import 'package:flower_order/pages/order_second/order_list/order_list_tool.dart';
import 'package:flower_order/pages/order_second/order_list/order_list_view.dart';
import 'package:flower_order/pages/order_second/order_second_binding.dart';
import 'package:flower_order/pages/order_second/order_second_view.dart';
import 'package:flower_order/pages/order_tab/order_desc/desc_binding.dart';
import 'package:flower_order/pages/order_tab/order_desc/desc_view.dart';
import 'package:flower_order/pages/order_tab/order_tab_binding.dart';
import 'package:flower_order/pages/order_tab/order_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff2eba95);
Color bgColor = const Color(0xfff5f5f5);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBOrder().init());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages,
      initialRoute: '/en',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Pages = [
  GetPage(name: '/en', page: () => const DescView(), binding: DescBinding()),
  GetPage(name: '/orderTab', page: () => OrderTabPage(), binding: OrderTabBinding()),
  GetPage(name: '/orderFirst', page: () => OrderFirstPage(), binding: OrderFirstBinding()),
  GetPage(name: '/orderSecond', page: () => OrderSecondPage(), binding: OrderSecondBinding()),
  GetPage(name: '/orderTool', page: () => const ListToolContral()),
  GetPage(name: '/orderAdd', page: () => OrderAddPage(), binding: OrderAddBinding()),
  GetPage(name: '/orderList', page: () =>  OrderListPage(), binding: OrderListBinding())
];
