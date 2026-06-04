import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  int _currentStep = 0;
  String _addMethod = 'manual'; // 'repo' or 'manual'
  String _productStatus = 'active'; // 'active' or 'inactive'

  final List<String> _stepTitles = [
    'Basic Info',
    'Pricing & Stock',
    'Product Details',
    'Preview',
  ];

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Product',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Add new product to your store',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 11.sp),
            ),
          ],
        ),
        actions: [
          // TextButton.icon(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.help_outline,
          //     color: const Color(0xFF289229),
          //     size: 18.sp,
          //   ),
          //   label: Text(
          //     'Help',
          //     style: TextStyle(
          //       color: const Color(0xFF289229),
          //       fontSize: 14.sp,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          // SizedBox(width: 8.w),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                //   _buildMethodSelector(),
                // SizedBox(height: 24.h),
                _buildStepperIndicator(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: _buildCurrentStepContent(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // --- 1. Top Method Selector ---
  Widget _buildMethodSelector() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _addMethod = 'repo'),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: _addMethod == 'repo'
                    ? const Color(0xFFF0FDF4)
                    : Colors.white,
                border: Border.all(
                  color: _addMethod == 'repo'
                      ? const Color(0xFF289229)
                      : Colors.grey.shade300,
                  width: _addMethod == 'repo' ? 1.5 : 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.inventory,
                    color: const Color(0xFF289229),
                    size: 32.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add from Central Repo',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F4EA),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'Recommended',
                            style: TextStyle(
                              color: const Color(0xFF289229),
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'Choose from 10,000+ products',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 9.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_addMethod == 'repo')
                    Icon(
                      Icons.check_circle,
                      color: const Color(0xFF289229),
                      size: 20.sp,
                    ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _addMethod = 'manual'),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: _addMethod == 'manual'
                    ? const Color(0xFFF0FDF4)
                    : Colors.white,
                border: Border.all(
                  color: _addMethod == 'manual'
                      ? const Color(0xFF289229)
                      : Colors.grey.shade300,
                  width: _addMethod == 'manual' ? 1.5 : 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.assignment_add,
                    color: Colors.grey.shade600,
                    size: 32.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Manually',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Create a new product step by step',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 9.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_addMethod == 'manual')
                    Icon(
                      Icons.check_circle,
                      color: const Color(0xFF289229),
                      size: 20.sp,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.grey.shade400,
                      size: 20.sp,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- 2. Stepper Indicator ---
  Widget _buildStepperIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(_stepTitles.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Connector Line
          final stepIndex = index ~/ 2;
          final isCompleted = stepIndex < _currentStep;
          return Expanded(
            child: Container(
              height: 2.h,
              alignment: Alignment.center,
              color: isCompleted
                  ? const Color(0xFF289229)
                  : Colors.grey.shade300,
            ),
          );
        } else {
          // Step Icon & Label
          final stepIndex = index ~/ 2;
          final isActive = stepIndex == _currentStep;
          final isCompleted = stepIndex < _currentStep;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: isCompleted || isActive
                      ? const Color(0xFF289229)
                      : Colors.white,
                  border: Border.all(
                    color: isCompleted || isActive
                        ? const Color(0xFF289229)
                        : Colors.grey.shade300,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                      : Text(
                          '${stepIndex + 1}',
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : Colors.grey.shade500,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                _stepTitles[stepIndex],
                style: TextStyle(
                  color: isActive || isCompleted
                      ? const Color(0xFF289229)
                      : Colors.grey.shade500,
                  fontSize: 10.sp,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  // --- 3. Step Content Routing ---
  Widget _buildCurrentStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildBasicInfoStep();
      case 1:
        return _buildPricingStockStep();
      case 2:
        return _buildDetailsStep();
      case 3:
        return const Center(child: Text('Preview Screen Placeholder'));
      default:
        return const SizedBox();
    }
  }

  // --- Step 1: Basic Info ---
  Widget _buildBasicInfoStep() {
    return _formCard(
      title: 'Basic Information',
      subtitle: 'Add basic details about your product',
      icon: Icons.description_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Product Name *', 'Enter product name'),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildDropdownField('Category *', 'Select category'),
                    SizedBox(height: 16.h),
                    _buildDropdownField('Sub Category', 'Select sub category'),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                flex: 1,
                child: Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: const Color(0xFF289229).withOpacity(0.5),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: const Color(0xFF289229),
                        size: 28.sp,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Add Image',
                        style: TextStyle(
                          color: const Color(0xFF289229),
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'JPG, PNG up to 2MB',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildTextField('Brand (Optional)', 'Select brand'),
        ],
      ),
    );
  }

  // --- Step 2: Pricing & Stock ---
  Widget _buildPricingStockStep() {
    return _formCard(
      title: 'Pricing & Stock',
      subtitle: 'Set price, stock and unit details',
      icon: Icons.sell_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _buildTextField('Selling Price (₹) *', '0.00')),
              SizedBox(width: 16.w),
              Expanded(child: _buildTextField('MRP (₹)', '0.00')),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildTextField('Stock Quantity *', 'Enter stock'),
              ),
              SizedBox(width: 16.w),
              Expanded(child: _buildDropdownField('Unit *', 'Select unit')),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6F8),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: const Color(0xFF289229),
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 11.sp,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Tip: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Keep your stock updated to avoid order cancellations.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Step 3: Product Details & Status ---
  Widget _buildDetailsStep() {
    return Column(
      children: [
        _formCard(
          title: 'Product Details',
          subtitle: 'Add more information about your product',
          icon: Icons.article_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                'Short Description (Optional)',
                'Enter short description',
                maxLines: 3,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'HSN Code (Optional)',
                      'Enter HSN code',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildTextField(
                      'Barcode (Optional)',
                      'Enter barcode',
                      suffixIcon: Icons.qr_code_scanner,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        _formCard(
          title: 'Product Status',
          subtitle: 'Choose product visibility in your store',
          icon: Icons.verified_user_outlined,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _productStatus = 'active'),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: _productStatus == 'active'
                          ? const Color(0xFFF0FDF4)
                          : Colors.white,
                      border: Border.all(
                        color: _productStatus == 'active'
                            ? const Color(0xFF289229)
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Active',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              'Visible in store',
                              style: TextStyle(
                                color: const Color(0xFF289229),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        if (_productStatus == 'active')
                          Icon(
                            Icons.check_circle,
                            color: const Color(0xFF289229),
                            size: 20.sp,
                          )
                        else
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.grey.shade300,
                            size: 20.sp,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _productStatus = 'inactive'),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: _productStatus == 'inactive'
                          ? Colors.grey.shade50
                          : Colors.white,
                      border: Border.all(
                        color: _productStatus == 'inactive'
                            ? Colors.grey.shade400
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inactive',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              'Hidden from store',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        if (_productStatus == 'inactive')
                          Icon(
                            Icons.check_circle,
                            color: Colors.grey.shade600,
                            size: 20.sp,
                          )
                        else
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.grey.shade300,
                            size: 20.sp,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Bottom Action Bar ---
  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: OutlinedButton(
                onPressed: _currentStep == 0 ? () {} : _prevStep,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  side: BorderSide(color: const Color(0xFF289229)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  _currentStep == 0 ? 'Cancel' : 'Back',
                  style: TextStyle(
                    color: const Color(0xFF289229),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF289229),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _currentStep < 3
                          ? 'Next: ${_stepTitles[_currentStep + 1]}'
                          : 'Save Product',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_currentStep < 3) ...[
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- UI Helpers ---
  Widget _formCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(icon, color: const Color(0xFF289229), size: 18.sp),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    int maxLines = 1,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label.replaceAll(' *', ''),
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
            children: [
              if (label.contains('*'))
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: const Color(0xFF289229), size: 20.sp)
                : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Color(0xFF289229)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label.replaceAll(' *', ''),
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
            children: [
              if (label.contains('*'))
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade500,
                size: 20.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
