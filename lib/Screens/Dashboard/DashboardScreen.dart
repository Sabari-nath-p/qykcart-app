import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qykcart_app/Consts/ColorConst.dart';
import 'package:qykcart_app/Screens/Dashboard/Service/DashboardController.dart';
import 'package:qykcart_app/Screens/HomeScreen/HomeScreen.dart';
import 'package:qykcart_app/Screens/OrderScreen/OrderScreen.dart';
import 'package:qykcart_app/Screens/ProductScreen/ProductScreen.dart';
import 'package:qykcart_app/Screens/test.dart';

class HomeDashboard extends StatelessWidget {
  HomeDashboard({super.key});
  final items = [
    {'icon': Icons.home_outlined, 'label': 'Home', 'badge': 0},
    {'icon': Icons.inventory_2_outlined, 'label': 'Products', 'badge': 0},
    {'icon': Icons.shopping_bag_outlined, 'label': 'Orders', 'badge': 16},
    {'icon': Icons.donut_large_outlined, 'label': 'Analytics', 'badge': 0},
    {'icon': Icons.grid_view_outlined, 'label': 'More', 'badge': 0},
  ];

  Dashboardcontroller dCtrl = Get.put(Dashboardcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'QYK KART',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '— Your Shop, Your Way —',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 7.sp,
                    letterSpacing: -0.1,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.black54,
                  size: 21.sp,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xff289229).withValues(alpha: .12),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(
              Icons.store_outlined,
              color: Color(0xff289229),
              size: 18,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<Dashboardcontroller>(
        builder: (__) {
          return SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.03),
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: SizedBox(
                height: 62,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(items.length, (i) {
                    final it = items[i];
                    final active = __.selectedPageIndex == i;
                    return GestureDetector(
                      onTap: () {
                        __.selectedPageIndex = i;
                        __.update();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                it['icon'] as IconData,
                                color: active ? primaryColor : Colors.grey,
                                size: 22,
                              ),
                              if ((it['badge'] as int) > 0)
                                Positioned(
                                  top: -5,
                                  right: -8,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${it['badge']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            it['label'] as String,
                            style: TextStyle(
                              fontSize: 9.5,
                              color: active ? primaryColor : Colors.grey,
                              fontWeight: active
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
      body: GetBuilder<Dashboardcontroller>(
        builder: (__) {
          return SafeArea(
            child: [
              HomeScreen(),
              ProductScreen(),
              OrdersScreen(),
            ][dCtrl.selectedPageIndex],
          );
        },
      ),
    );
  }
}
