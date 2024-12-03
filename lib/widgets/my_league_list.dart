import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perbaikan_pas_11pplg1_29/Controllers/league_controller.dart';
import 'package:perbaikan_pas_11pplg1_29/widgets/my_league_card.dart';
import 'package:perbaikan_pas_11pplg1_29/page/detail_page.dart';

class MyLeagueList extends StatelessWidget {
  const MyLeagueList({super.key});

  @override
  Widget build(BuildContext context) {
    final LeagueController leagueController = Get.put(LeagueController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Obx(() {
                if (leagueController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: leagueController.leagueList.length,
                  itemBuilder: (context, index) {
                    final leagueModel = leagueController.leagueList[index];
                    return MyLeagueCard(
                      leagueModel: leagueModel,
                      leagueController: leagueController,
                      onCardTap: () {
                        Get.to(
                          DetailPage(
                            leagueModel: leagueModel,
                            leagueController: leagueController,
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
