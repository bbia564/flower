import 'package:flower_order/pages/order_first/order_first_logic.dart';
import 'package:flower_order/pages/order_first/order_first_view.dart';
import 'package:flower_order/pages/order_second/order_second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'order_tab_logic.dart';

class OrderTabPage extends GetView<OrderTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          OrderFirstPage(),
          OrderSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navOrderBars()),
    );
  }

  Widget _navOrderBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Records',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: Colors.grey.withOpacity(0.6),size: 40,),
          activeIcon:Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'More',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/orderAdd')?.then((_) {
            OrderFirstLogic firstLogic = Get.find<OrderFirstLogic>();
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
