import 'package:blookly_app/constants.dart';
import 'package:blookly_app/feature/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
