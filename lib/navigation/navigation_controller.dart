import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/home/screens/home.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.red,
    )
  ];
}
