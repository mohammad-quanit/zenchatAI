import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/chatbot/screens/chat_bot.dart';
import 'package:zenchatai/features/home/screens/home.dart';
import 'package:zenchatai/features/profile/screens/user_profile.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    ChatScreen(),
    Container(
      color: Colors.yellow,
    ),
    const ProfileScreen(),
  ];
}
