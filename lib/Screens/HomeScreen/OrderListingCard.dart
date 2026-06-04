import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderListingCard extends StatelessWidget {
  var o;
  OrderListingCard({super.key, required this.o});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          // Column 1: Order ID & Time
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  o['id'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${o['time']} • ${o['date']}',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          // Column 2: Name & Items
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  o['name'] as String,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  o['items'] as String,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          // Column 3: Amount & Payment Info
          // Expanded(
          //   flex: 2,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         o['amt'] as String,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12.sp,
          //         ),
          //       ),
          //       SizedBox(height: 4.h),
          //       Text(
          //         o['pay'] as String,
          //         style: TextStyle(
          //           color: Colors.grey.shade500,
          //           fontSize: 10.sp,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Column 4: Status Tag & Arrow
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: o['color'] as Color,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              o['status'] as String,
              style: TextStyle(
                color: o['textColor'] as Color,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 16.sp),
        ],
      ),
    );
  }
}
