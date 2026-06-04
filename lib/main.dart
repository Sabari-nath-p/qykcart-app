import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qykcart_app/Screens/AuthenticationScreen/AuthenticationScreen.dart';

void main() {
  runApp(QykcartApp());
}

class QykcartApp extends StatelessWidget {
  const QykcartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 850),
      builder: (context, size) {
        return GetMaterialApp(
          color: Color(0xff289229),
          theme: ThemeData(fontFamily: "Inter"),
          home: AuthenticationScreen(),
        );
      },
    );
  }
}
