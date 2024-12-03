import 'package:perbaikan_pas_11pplg1_29/page/login_page.dart';
import 'package:perbaikan_pas_11pplg1_29/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:perbaikan_pas_11pplg1_29/page/menu/league_page.dart';
import 'package:perbaikan_pas_11pplg1_29/page/menu/profile_page.dart';
import 'package:perbaikan_pas_11pplg1_29/page/menu/saved_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/league', page: () => const LeaguePage()),
        GetPage(name: '/saved', page: () => const SavedPage()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
      ],
    );
  }
}