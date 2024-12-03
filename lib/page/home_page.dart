import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perbaikan_pas_11pplg1_29/Controllers/bottom_nav_controller.dart';
import 'package:perbaikan_pas_11pplg1_29/page/menu/league_page.dart';
import 'package:perbaikan_pas_11pplg1_29/page/menu/saved_page.dart';
import 'package:perbaikan_pas_11pplg1_29/page/menu/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.put(BottomNavController());

    final List<Widget> menus = [LeaguePage(), SavedPage(), ProfilePage()];

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: "League"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}
