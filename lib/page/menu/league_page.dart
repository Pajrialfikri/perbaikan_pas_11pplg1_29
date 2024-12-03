import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perbaikan_pas_11pplg1_29/Controllers/league_controller.dart';
import 'package:perbaikan_pas_11pplg1_29/widgets/my_league_list.dart';
import 'package:perbaikan_pas_11pplg1_29/widgets/my_app_bar.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LeagueController leagueController = Get.put(LeagueController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const MyAppBar(
        title: 'Premier League',
        fontSize: 26,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (leagueController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: MyLeagueList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
