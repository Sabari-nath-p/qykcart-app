import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qykcart_app/Screens/HomeScreen/OrderListingCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderCard(),
              SizedBox(height: 16.h),
              _buildStatsGrid(),
              SizedBox(height: 24.h),
              _buildQuickActions(),
              SizedBox(height: 24.h),
              _buildTodaysOverview(),
              SizedBox(height: 24.h),
              _buildRecentOrders(),
              SizedBox(height: 24.h),
              _buildGrowBusinessBanner(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // --- 1. Header Card ---
  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF319A3A), Color(0xFF1E7025)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning,',
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    'Shop Owner',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text('👋', style: TextStyle(fontSize: 20.sp)),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "Here's what's happening with your store today.",
                style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Store is Online',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.keyboard_arrow_down, size: 16.sp),
                  ],
                ),
              ),
            ],
          ),
          // Placeholder for the basket graphic
          Positioned(
            right: 0,
            top: 0,
            child: Icon(
              Icons.shopping_basket_rounded,
              color: Colors.white.withOpacity(0.2),
              size: 80.sp,
            ),
          ),
        ],
      ),
    );
  }

  // --- 2. Stats Grid ---
  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      childAspectRatio: 1.5,
      children: [
        _statCard(
          icon: Icons.shopping_bag_outlined,
          title: "Today's Orders",
          value: "28",
          subtext: "↑ 12% vs yesterday",
          subtextColor: Colors.green,
          iconColor: Colors.green,
        ),
        _statCard(
          icon: Icons.access_time,
          title: "Pending Orders",
          value: "16",
          subtext: "View all >",
          subtextColor: Colors.grey.shade600,
          iconColor: Colors.orange,
        ),
        _statCard(
          icon: Icons.account_balance_wallet_outlined,
          title: "Revenue Today",
          value: "₹ 18,450",
          subtext: "↑ 18% vs yesterday",
          subtextColor: Colors.green,
          iconColor: Colors.green,
        ),
        _statCard(
          icon: Icons.inventory_2_outlined,
          title: "Products",
          value: "142",
          subtext: "View all >",
          subtextColor: Colors.grey.shade600,
          iconColor: Colors.brown,
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtext,
    required Color subtextColor,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11.sp),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          // Text(
          //   subtext,
          //   style: TextStyle(
          //     color: subtextColor,
          //     fontSize: 10.sp,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
    );
  }

  // --- 3. Quick Actions ---
  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.add, 'label': 'Add Product'},
      //   {'icon': Icons.receipt_long, 'label': 'Orders'},
      {'icon': Icons.people_outline, 'label': 'Customers'},
      {'icon': Icons.bar_chart, 'label': 'Analytics'},
      //{'icon': Icons.local_offer_outlined, 'label': 'Offers'},
      {'icon': Icons.settings_outlined, 'label': 'Settings'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.h),
        Row(
          children: actions.map((action) {
            final isAddProduct = action['label'] == 'Add Product';
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.w,
                      decoration: BoxDecoration(
                        color: isAddProduct
                            ? const Color(0xFF289229)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        action['icon'] as IconData,
                        color: isAddProduct
                            ? Colors.white
                            : const Color(0xFF289229),
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      action['label'] as String,
                      style: TextStyle(fontSize: 11.sp, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // --- 4. Today's Overview ---
  Widget _buildTodaysOverview() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Overview",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey.shade300),
            //     borderRadius: BorderRadius.circular(16.r),
            //   ),
            //   child: Row(
            //     children: [
            //       Text('Today', style: TextStyle(fontSize: 12.sp)),
            //       SizedBox(width: 4.w),
            //       Icon(Icons.keyboard_arrow_down, size: 16.sp),
            //     ],
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _overviewCard(
                'Total Orders',
                '28',
                Icons.shopping_cart_outlined,
                Colors.green,
              ),
              _overviewCard(
                'Delivered',
                '12',
                Icons.check_circle_outline,
                Colors.green,
              ),
              _overviewCard(
                'Cancelled',
                '2',
                Icons.cancel_outlined,
                Colors.red,
              ),
              _overviewCard(
                'Avg. Order Value',
                '₹658',
                Icons.insert_chart_outlined,
                Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _overviewCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 120.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Icon(icon, color: color, size: 20.sp),
            ],
          ),
          SizedBox(height: 8.h),
          // Sparkline placeholder
          Icon(
            color == Colors.green ? Icons.trending_up : Icons.trending_down,
            color: color,
            size: 24.sp,
          ),
        ],
      ),
    );
  }

  // --- 5. Recent Orders ---
  Widget _buildRecentOrders() {
    final orders = [
      {
        'id': '#QYK12580',
        'time': '10:30 AM',
        'date': 'May 24',
        'name': 'Rahul Kumar',
        'items': '12 Items',
        'amt': '₹1,245',
        'pay': 'Online Payment',
        'status': 'New',
        'color': Colors.green.shade100,
        'textColor': Colors.green.shade700,
      },
      {
        'id': '#QYK12579',
        'time': '10:15 AM',
        'date': 'May 24',
        'name': 'Priya Singh',
        'items': '8 Items',
        'amt': '₹876',
        'pay': 'COD',
        'status': 'Packing',
        'color': Colors.orange.shade100,
        'textColor': Colors.orange.shade800,
      },
      {
        'id': '#QYK12578',
        'time': '09:45 AM',
        'date': 'May 24',
        'name': 'Amit Verma',
        'items': '15 Items',
        'amt': '₹2,034',
        'pay': 'Online Payment',
        'status': 'Packed',
        'color': Colors.blue.shade100,
        'textColor': Colors.blue.shade700,
      },
      {
        'id': '#QYK12577',
        'time': '09:20 AM',
        'date': 'May 24',
        'name': 'Neha Gupta',
        'items': '6 Items',
        'amt': '₹598',
        'pay': 'COD',
        'status': 'Delivered',
        'color': Colors.green.shade100,
        'textColor': Colors.green.shade700,
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Orders',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'View All >',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFF289229),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.grey.shade200),
            itemBuilder: (context, index) {
              final o = orders[index];
              return OrderListingCard(o: o);
            },
          ),
        ),
      ],
    );
  }

  // --- 6. Grow Your Business Banner ---
  Widget _buildGrowBusinessBanner() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4), // Light green tint
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        children: [
          Icon(Icons.storefront, color: Colors.green, size: 36.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grow your business',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Share your store link and get more customers.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.share, color: Colors.green, size: 14.sp),
                SizedBox(width: 4.w),
                Text(
                  'Share Store',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
