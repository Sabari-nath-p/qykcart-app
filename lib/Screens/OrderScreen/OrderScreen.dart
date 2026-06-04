import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // /appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _buildStatusCards(),
            SizedBox(height: 16.h),
            _buildFilters(),
            SizedBox(height: 16.h),
            _buildSortAndCount(),
            SizedBox(height: 12.h),
            _buildOrderList(),
            SizedBox(height: 80.h), // Padding for Bottom Navigation Bar
          ],
        ),
      ),
    );
  }

  // --- 1. App Bar ---
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Manage and track your orders',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 11.sp),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black87, size: 22.sp),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.filter_alt_outlined,
            color: Colors.black87,
            size: 22.sp,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  // --- 2. Status Cards (Horizontal Scroll) ---
  Widget _buildStatusCards() {
    final statuses = [
      {
        'label': 'All',
        'count': '128',
        'icon': Icons.shopping_bag_outlined,
        'color': const Color(0xFF289229),
        'active': true,
      },
      {
        'label': 'New',
        'count': '18',
        'icon': Icons.assignment_turned_in_outlined,
        'color': Colors.blue.shade600,
        'active': false,
      },
      {
        'label': 'Processing',
        'count': '26',
        'icon': Icons.inventory_2_outlined,
        'color': Colors.orange.shade700,
        'active': false,
      },
      {
        'label': 'Out for Delivery',
        'count': '14',
        'icon': Icons.local_shipping_outlined,
        'color': Colors.purple.shade600,
        'active': false,
      },
      {
        'label': 'Delivered',
        'count': '62',
        'icon': Icons.check_circle_outline,
        'color': const Color(0xFF289229),
        'active': false,
      },
      {
        'label': 'Cancelled',
        'count': '8',
        'icon': Icons.cancel_outlined,
        'color': Colors.red.shade600,
        'active': false,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: statuses.map((status) {
          final isActive = status['active'] as bool;
          final color = status['color'] as Color;

          return Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFF0FDF4) : Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isActive
                    ? const Color(0xFF289229).withOpacity(0.3)
                    : Colors.grey.shade200,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(status['icon'] as IconData, color: color, size: 14.sp),
                    SizedBox(width: 6.w),
                    Text(
                      status['label'] as String,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  status['count'] as String,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- 3. Filters Row ---
  Widget _buildFilters() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: _filterButton(Icons.calendar_today, 'Date: This Week', true),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _filterButton(Icons.person_outline, 'All Customers', true),
          ),
          SizedBox(width: 8.w),
          Expanded(child: _filterButton(Icons.tune, 'More Filters', false)),
        ],
      ),
    );
  }

  Widget _filterButton(IconData icon, String text, bool hasDropdown) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 14.sp, color: Colors.grey.shade600),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (hasDropdown)
            Icon(
              Icons.keyboard_arrow_down,
              size: 14.sp,
              color: Colors.grey.shade600,
            ),
        ],
      ),
    );
  }

  // --- 4. Sort and Count ---
  Widget _buildSortAndCount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Newest First',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.swap_vert, size: 16.sp, color: Colors.grey.shade600),
            ],
          ),
          Row(
            children: [
              Text(
                '128 Orders',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.refresh, size: 16.sp, color: Colors.grey.shade600),
            ],
          ),
        ],
      ),
    );
  }

  // --- 5. Order List ---
  Widget _buildOrderList() {
    final orders = [
      {
        'id': '#QYK12580',
        'date': 'May 24, 2024 • 10:30 AM',
        'status': 'New',
        'statusColor': const Color(0xFF289229),
        'statusBg': const Color(0xFFF0FDF4),
        'icon': Icons.shopping_bag_outlined,
        'name': 'Rahul Kumar',
        'phone': '+91 98765 43210',
        'items': '12 Items',
        'amt': '₹1,245',
        'payType': 'Online Payment',
        'address': 'Sector 16, Noida, UP',
        'payStatus': 'Paid',
        'payColor': const Color(0xFF289229),
      },
      {
        'id': '#QYK12579',
        'date': 'May 24, 2024 • 10:15 AM',
        'status': 'Packing',
        'statusColor': Colors.orange.shade800,
        'statusBg': Colors.orange.shade50,
        'icon': Icons.inventory_2_outlined,
        'name': 'Priya Singh',
        'phone': '+91 98765 12345',
        'items': '8 Items',
        'amt': '₹876',
        'payType': 'COD',
        'address': 'Indirapuram, Ghaziabad',
        'payStatus': 'COD',
        'payColor': Colors.orange.shade800,
      },
      {
        'id': '#QYK12578',
        'date': 'May 24, 2024 • 09:45 AM',
        'status': 'Packed',
        'statusColor': Colors.blue.shade700,
        'statusBg': Colors.blue.shade50,
        'icon': Icons.electric_moped_outlined,
        'name': 'Amit Verma',
        'phone': '+91 98765 67890',
        'items': '15 Items',
        'amt': '₹2,034',
        'payType': 'Online Payment',
        'address': 'Vaishali, Ghaziabad',
        'payStatus': 'Paid',
        'payColor': const Color(0xFF289229),
      },
      {
        'id': '#QYK12577',
        'date': 'May 24, 2024 • 09:20 AM',
        'status': 'Delivered',
        'statusColor': const Color(0xFF289229),
        'statusBg': const Color(0xFFF0FDF4),
        'icon': Icons.check_circle_outline,
        'name': 'Neha Gupta',
        'phone': '+91 98765 11111',
        'items': '6 Items',
        'amt': '₹598',
        'payType': 'COD',
        'address': 'Crossing Republik, Ghaziabad',
        'payStatus': 'COD',
        'payColor': Colors.orange.shade800,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: orders.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final o = orders[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              // --- Top Half ---
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Icon
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: o['statusBg'] as Color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        o['icon'] as IconData,
                        color: o['statusColor'] as Color,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Order Info
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            o['id'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            o['date'] as String,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: o['statusBg'] as Color,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              o['status'] as String,
                              style: TextStyle(
                                color: o['statusColor'] as Color,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Customer Info
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            o['name'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            o['phone'] as String,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            o['items'] as String,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Amount & Payment
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                o['amt'] as String,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.chevron_right,
                                size: 18.sp,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 22.w,
                            ), // Align under the amount, ignoring the chevron
                            child: Text(
                              o['payType'] as String,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 10.sp,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: Colors.grey.shade200),

              // --- Bottom Half ---
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  children: [
                    // Address
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            o['address'] as String,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Payment Status
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: (o['payColor'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              o['payStatus'] as String,
                              style: TextStyle(
                                color: o['payColor'] as Color,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Action Button
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Action',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF289229),
                              ),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                color: const Color(0xFF289229),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
