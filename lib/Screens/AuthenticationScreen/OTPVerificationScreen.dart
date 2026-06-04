import 'dart:async';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:qykcart_app/Consts/ColorConst.dart';
import 'package:qykcart_app/Screens/AuthenticationScreen/Service/AuthenticationController.dart';
import 'package:qykcart_app/Screens/Dashboard/DashboardScreen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Authenticationcontroller authCtrl = Get.put(Authenticationcontroller());

  // 6 controllers & focus nodes for OTP boxes
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  // Countdown timer
  int _secondsRemaining = 28;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 28;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining == 0) {
        t.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  String get _timerText {
    final m = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get _enteredOtp => _otpControllers.map((c) => c.text).join();

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _otpControllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<Authenticationcontroller>(
        builder: (__) {
          return Stack(
            children: [
              // ── Background image ──────────────────────────────────
              Positioned.fill(
                child: Image.asset(
                  "assets/images/otpbg.png",
                  fit: BoxFit.cover,
                ),
              ),

              // ── Main scrollable content ───────────────────────────
              Container(
                margin: EdgeInsets.only(top: 260.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Title ───────────────────────────
                    Text(
                      "Verify OTP",
                      style: TextStyle(
                        fontSize: 18.sp,
                        letterSpacing: -.5,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0D2D32),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "We have sent a 6 digit OTP to",
                      style: TextStyle(
                        fontSize: 12.sp,
                        letterSpacing: -.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff0D2D32).withOpacity(.6),
                      ),
                    ),
                    SizedBox(height: 6.h),

                    // ── Phone + Change ───────────────────
                    Row(
                      children: [
                        Text(
                          "+${CountryPickerUtils.getCountryByIsoCode(__.selectedCountry).phoneCode} ${__.phoneNumberController.text.trim()}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff289229),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Row(
                            children: [
                              Text(
                                "Change",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff289229),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                CupertinoIcons.pencil,
                                size: 14,
                                color: const Color(0xff289229),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // ── OTP Boxes ────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (i) {
                        final isFilled = _otpControllers[i].text.isNotEmpty;
                        return SizedBox(
                          width: 46.w,
                          height: 52.h,
                          child: TextField(
                            controller: _otpControllers[i],
                            focusNode: _focusNodes[i],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff0D2D32),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              counterText: "",
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: isFilled
                                      ? const Color(0xff289229)
                                      : Colors.grey.withOpacity(.4),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: Color(0xff289229),
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {});
                              _onOtpChanged(val, i);
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 16.h),

                    // ── Resend Timer ─────────────────────
                    Center(
                      child: _canResend
                          ? GestureDetector(
                              onTap: () {
                                _startTimer();
                                // TODO: call resend OTP API
                              },
                              child: Text(
                                "Resend OTP",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff289229),
                                ),
                              ),
                            )
                          : RichText(
                              text: TextSpan(
                                text: "Resend OTP in ",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(
                                    0xff0D2D32,
                                  ).withOpacity(.6),
                                ),
                                children: [
                                  TextSpan(
                                    text: _timerText,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff289229),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(height: 20.h),

                    // ── Verify OTP Button ────────────────
                    GestureDetector(
                      onTap: () {
                        if (_enteredOtp.length == 6) {
                          // TODO: call verify OTP
                        }
                        Get.to(
                          () => HomeDashboard(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff289229),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 36.w),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Text(
                                  "Verify OTP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: const BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // ── Continue with WhatsApp Button ─────
                    SizedBox(height: 90.h),
                    Spacer(), // ── Didn't receive OTP card ───────────
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffEDF7ED),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff289229),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Icon(
                              CupertinoIcons.lock_shield_fill,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Didn't receive OTP?",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff0D2D32),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  "Please check your messages or try resending the OTP.",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(
                                      0xff0D2D32,
                                    ).withOpacity(.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),

              // ── Terms at bottom ───────────────────────────────────
            ],
          );
        },
      ),
    );
  }
}
