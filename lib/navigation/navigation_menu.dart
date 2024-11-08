import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenchatai/navigation/navigation_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    final isDarkMode = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 70,
            elevation: 0,
            backgroundColor: isDarkMode ? ZColors.black : ZColors.white,
            indicatorColor: isDarkMode
                ? ZColors.white.withOpacity(0.1)
                : ZColors.black.withOpacity(0.1),
            selectedIndex: navController.selectedIndex.value,
            onDestinationSelected: (index) =>
                navController.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.voice_cricle),
                label: 'Zen Assistant',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.people),
                label: 'Community',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.user),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: Obx(
            () => navController.screens[navController.selectedIndex.value]));
  }
}
