import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Orderdetailsscreen extends StatelessWidget {
  const Orderdetailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Details',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Order ID: #QYK12580',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 16.r,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Cancel Order',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1B631C),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save_outlined,
                      color: Colors.white,
                      size: 16.r,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Save Changes',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
            // STATUS CARD

            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.green.shade50,
                    child: Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.green,
                      size: 20.r,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Status',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 11.sp,
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            'Out for Delivery',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.green,
                            size: 18.r,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  Text(
                    'Change Status',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            // CUSTOMER CARD

            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                        size: 18.r,
                      ),

                      SizedBox(width: 6.w),

                      Text(
                        'Customer Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),

                      const Spacer(),

                      Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 16.h),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rahul Kumar',
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),

                            SizedBox(height: 4.h),

                            Text(
                              '+91 98765 43210',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),

                            SizedBox(height: 2.h),

                            Text(
                              'rahulkumar@gmail.com',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),

                            SizedBox(height: 2.h),

                            Text(
                              'Sector 16, Noida, Uttar Pradesh - 201301',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor:
                                Colors.grey.shade100,
                            child: Icon(
                              Icons.call_outlined,
                              size: 18.r,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            'Call',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 12.w),

                      Column(
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor:
                                Colors.grey.shade100,
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 18.r,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            'Map',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),
                       

            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        color: Colors.grey,
                        size: 18.r,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 16.h),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Date',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'May 24 · 10:30 AM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Online Payment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Status',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),

                          Container(
                            padding:
                                EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  Colors.green.shade50,
                              borderRadius:
                                  BorderRadius.circular(
                                20.r,
                              ),
                            ),
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight:
                                    FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Divider(height: 16.h),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      _summaryItem('Items', '12'),
                      _summaryItem(
                          'Subtotal', '₹1,200'),
                      _summaryItem(
                          'Delivery', '₹45'),
                      _summaryItem(
                        'Total',
                        '₹1,245',
                        isGreen: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            // ORDER ITEMS

            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.grey,
                        size: 18.r,
                      ),
                      SizedBox(width: 6.w),

                      Text(
                        'Order Items',
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Add Item +',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 16.h),

                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Item',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          'Qty',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 16.h),

                  _buildItemRow(
                   'assets/images/item1.jpeg',
                    'Aashirvaad Atta 5kg',
                     'SKU: ATT001',
                    '₹250',
                    '2',
                    '₹500',
                  ),

                  Divider(height: 16.h),

                  _buildItemRow(
                    'assets/images/item2.jpeg',
                    'Fortune Oil 1L',
                    'SKU: OIL001',
                    '₹180',
                    '1',
                    '₹180',
                  ),
                 
                 Divider(height: 16.h),

                _buildItemRow(
                  'assets/images/item3.jpeg',
                    'India Gate Basmati Rice 1kg',
                    'SKU: RICE001',
                    '₹160',
                    '2',
                    '₹320',
),
                  SizedBox(height: 12.h),

                  Container(
                    width: double.infinity,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                        8.r,
                      ),
                      border: Border.all(
                        color:
                            Colors.grey.shade300,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+ Add New Item',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight:
                              FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey,
                          size: 18.r,
                        ),
                        SizedBox(width: 6.w),

                  Text(
                    'Order Timeline',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                     ],
                   ),
                    

                  Divider(height: 16.h),

                  _buildTimelineRow(
                    'May 24, 2024 · 10:30 AM',
                    'Order Placed',
                    false,
                    true,
                    
                  ),

                  _buildTimelineRow(
                    'May 24, 2024 · 11:00 AM',
                    'Order Confirmed',
                    false,
                    false,
                  ),

                  _buildTimelineRow(
                    'May 24, 2024 · 04:20 PM',
                    'Out for Delivery',
                    true,
                    false,
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Please deliver after 6 PM.',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(
    String title,
    String value, {
    bool isGreen = false,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color:
                isGreen ? Colors.green : Colors.grey,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            color:
                isGreen ? Colors.green : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemRow(
    String image,
    String name,
    String sku,
    String price,
    String qty,
    String total,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius:
                BorderRadius.circular(8.r),
          ),
          child: Image.asset(
         image,
          )
          
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
              Text(
                sku,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ),

        Text(price),

        SizedBox(width: 12.w),

        Text(
          qty,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(width: 16.w),

        Column(
          children: [
            Text(
              total,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.h),

            Row(
              children: [
                Icon(
                  Icons.edit_outlined,
                  size: 18.r,
                  color: Colors.green,
                ),
                SizedBox(width: 6.w),
                Icon(
                  Icons.delete_outline,
                  size: 18.r,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineRow(
    String date,
    String title,
    bool isLast,
    bool isactive,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 4.r,
              backgroundColor:
               isactive ? Colors.green : Colors.grey.shade400,
            ),
            if (!isLast)
              Container(
                width: 2.w,
                height: 32.h,
                color: isactive? Colors.green
            : Colors.grey.shade300,
              ),
          ],
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 12.h,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight:
                        FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

            