import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:qykcart_app/Consts/ColorConst.dart';
import 'package:qykcart_app/Screens/AuthenticationScreen/OTPVerificationScreen.dart';
import 'package:qykcart_app/Screens/AuthenticationScreen/Service/AuthenticationController.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});
  Authenticationcontroller authCtrl = Get.put(Authenticationcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<Authenticationcontroller>(
        builder: (__) {
          return Stack(
            children: [
              Image.asset("assets/images/loginbg.png", fit: BoxFit.cover),
              Positioned(
                bottom:
                    170.h +
                    ((MediaQuery.of(context).viewInsets.bottom > 0) ? 40 : 0),
                right: 20,
                left: 20,
                child: SafeArea(
                  child: Container(
                    width: 370.w,
                    height: 265.h,

                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.black12.withOpacity(.05),
                          spreadRadius: 1,
                          blurRadius: 12,
                        ),
                      ],
                      color: Color(0xFFFAFAF0),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login with Phone Number",
                          style: TextStyle(
                            fontSize: 15.sp,
                            letterSpacing: -.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0D2D32),
                          ),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          "we will send you a 6 digit otp",
                          style: TextStyle(
                            fontSize: 12.sp,
                            letterSpacing: -.5,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0D2D32),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff289229).withOpacity(.4),
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 110.w,
                                child: DropdownButton(
                                  dropdownColor: Color(0xFFFAFAF0),
                                  value: authCtrl.selectedCountry,
                                  selectedItemBuilder: (context) {
                                    return [
                                      for (var item in ["IN", "US"])
                                        Row(
                                          children: [
                                            SizedBox(width: 15.w),
                                            SizedBox(
                                              width: 20.w,
                                              height: 15.h,
                                              child: CountryPickerUtils.getDefaultFlagImage(
                                                CountryPickerUtils.getCountryByIsoCode(
                                                  item,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "+" +
                                                  CountryPickerUtils.getCountryByIsoCode(
                                                    item,
                                                  ).phoneCode,
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            SizedBox(width: 10),
                                          ],
                                        ),
                                    ];
                                  },
                                  icon: RotatedBox(
                                    quarterTurns: 3,
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      size: 15,
                                    ),
                                  ),
                                  items: ["IN", "US"]
                                      .map(
                                        (item) => DropdownMenuItem(
                                          value: item,

                                          child: Row(
                                            children: [
                                              SizedBox(width: 15.w),
                                              SizedBox(
                                                width: 20.w,
                                                height: 15.h,
                                                child: CountryPickerUtils.getDefaultFlagImage(
                                                  CountryPickerUtils.getCountryByIsoCode(
                                                    item,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Text(
                                                "+" +
                                                    CountryPickerUtils.getCountryByIsoCode(
                                                      item,
                                                    ).phoneCode,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  underline: Container(),

                                  onChanged: (value) {
                                    authCtrl.selectedCountry = value ?? "IN";
                                    authCtrl.update();
                                  },
                                ),
                              ),
                              Container(
                                height: 30.h,
                                width: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 25.w),
                              Expanded(
                                child: TextField(
                                  controller: __.phoneNumberController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter phone number",
                                    hintStyle: TextStyle(fontSize: 12.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),

                        InkWell(
                          onTap: () {
                            Get.to(() => OtpVerificationScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.h,
                            alignment: Alignment.center,
                            child: Text(
                              "Sent OTP",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff289229),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              CupertinoIcons.checkmark_shield_fill,
                              size: 15,
                              color: primaryColor,
                            ),
                            Text(
                              "  Your information is 100% secure",
                              style: TextStyle(
                                fontSize: 10.sp,
                                letterSpacing: -.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0D2D32),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By continuing, you agree to our ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: -.4,
                          fontWeight: FontWeight.w400,
                          color: textColor.withOpacity(.7),
                        ),
                      ),
                      Text(
                        "Terms & Conditions",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: -.4,
                          // decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
