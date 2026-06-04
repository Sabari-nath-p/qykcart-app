import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:qykcart_app/Screens/AddProductScreen/AddProductScreen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 20.h),
                _buildStatsRow(),
                SizedBox(height: 20.h),
                _buildSearchAndFilter(),
                SizedBox(height: 16.h),
                _buildTabsAndSort(),
                SizedBox(height: 16.h),
                _buildProductList(),
                SizedBox(height: 80.h), // Padding for bottom nav bar
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- 1. Header Area ---
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Products',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1B2A3B), // Dark blueish-black
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Manage  your products',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(
              () => AddProductScreen(),
              transition: Transition.rightToLeft,
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF289229),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  'Add Product',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- 2. Stats Row ---
  Widget _buildStatsRow() {
    return Row(
      children: [
        _statCard(
          title: 'Total Products',
          value: '142',
          subtext: 'All products',
          icon: Icons.inventory_2_outlined,
          iconColor: const Color(0xFF289229),
        ),
        // _statCard(
        //   title: 'Active',
        //   value: '128',
        //   subtext: 'Visible in store',
        //   icon: Icons.check_circle_outline,
        //   iconColor: const Color(0xFF289229),
        // ),
        _statCard(
          title: 'Low Stock',
          value: '8',
          subtext: 'Need attention',
          icon: Icons.warning_amber_rounded,
          iconColor: Colors.orange,
        ),
        _statCard(
          title: 'Out of Stock',
          value: '6',
          subtext: 'Not available',
          icon: Icons.inventory_outlined,
          iconColor: Colors.red,
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required String subtext,
    required IconData icon,
    required Color iconColor,
  }) {
    return Expanded(
      child: Container(
        //width: 110.w,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 16.sp),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtext,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. Search and Filter ---
  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44.h,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,

              decoration: InputDecoration(
                //  isDense: true,
                isCollapsed: true,
                hintText: 'Search products...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.sp,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                  size: 20.sp,
                ),
                border: InputBorder.none,
                //     contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: const Color(0xFF289229).withOpacity(0.5)),
          ),
          child: Row(
            children: [
              // Icon(
              //   Icons.filter_list,
              //   color: const Color(0xFF289229),
              //   size: 18.sp,
              // ),
              // SizedBox(width: 6.w),
              // Text(
              //   'Filter',
              //   style: TextStyle(
              //     color: const Color(0xFF289229),
              //     fontWeight: FontWeight.w500,
              //     fontSize: 12.sp,
              //   ),
              // ),
              Row(
                children: [
                  Text(
                    'Sort by: ',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 11.sp,
                    ),
                  ),
                  Text(
                    'Latest',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16.sp,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 4. Tabs and Sort Options ---
  Widget _buildTabsAndSort() {
    final tabs = ['All Products', 'In Stock', 'Low Stock', 'Out of Stock'];

    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tabs.map((tab) {
                final isActive = tab == 'All Products';
                return Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFFF0FDF4)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: isActive
                          ? const Color(0xFF289229)
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: isActive
                          ? const Color(0xFF289229)
                          : Colors.grey.shade600,
                      fontSize: 11.sp,
                      fontWeight: isActive
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }

  // --- 5. Product List ---
  Widget _buildProductList() {
    final products = [
      {
        'name': 'Aashirvaad Atta 5kg',
        'category': 'Food Grains',
        'price': '₹275.00',
        'stock': 45,
        'status': 'In Stock',
        'statusColor': const Color(0xFF289229),
        'bgColor': const Color(0xFFF0FDF4),
      },
      {
        'name': 'India Gate Basmati Rice 5kg',
        'category': 'Food Grains',
        'price': '₹699.00',
        'stock': 7,
        'status': 'Low Stock',
        'statusColor': Colors.orange.shade800,
        'bgColor': Colors.orange.shade50,
      },
      {
        'name': 'Fortune Sunflower Oil 5L',
        'category': 'Cooking Oil',
        'price': '₹899.00',
        'stock': 18,
        'status': 'In Stock',
        'statusColor': const Color(0xFF289229),
        'bgColor': const Color(0xFFF0FDF4),
      },
      {
        'name': 'Tata Salt 1kg',
        'category': 'Groceries',
        'price': '₹20.00',
        'stock': 0,
        'status': 'Out of Stock',
        'statusColor': Colors.red,
        'bgColor': Colors.red.shade50,
      },
      {
        'name': 'Toor Dal 1kg',
        'category': 'Pulses',
        'price': '₹128.00',
        'stock': 22,
        'status': 'In Stock',
        'statusColor': const Color(0xFF289229),
        'bgColor': const Color(0xFFF0FDF4),
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final p = products[index];
        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Placeholder
              Container(
                width: 60.w,
                height: 70.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Icon(
                  Icons.image_outlined,
                  color: Colors.grey.shade400,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p['name'] as String,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      p['category'] as String,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: p['bgColor'] as Color,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        p['status'] as String,
                        style: TextStyle(
                          color: p['statusColor'] as Color,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Price, Stock and Actions
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        p['price'] as String,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.more_vert,
                        size: 18.sp,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Stock: ${p['stock']}',
                    style: TextStyle(
                      color: (p['stock'] as int) == 0
                          ? Colors.red
                          : (p['stock'] as int) < 10
                          ? Colors.orange.shade800
                          : Colors.grey.shade600,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF289229).withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: const Color(0xFF289229),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
