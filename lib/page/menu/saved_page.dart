import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perbaikan_pas_11pplg1_29/Controllers/league_controller.dart';
import 'package:perbaikan_pas_11pplg1_29/widgets/my_app_bar.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LeagueController leagueController = Get.put(LeagueController());

    return Scaffold(
      appBar: const MyAppBar(
        title: 'Wishlist',
        fontSize: 26,
        showIcon: true,
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        if (leagueController.wishlist.isEmpty) {
          return Center(
            child: Text(
              'Your wishlist is empty',
              style: GoogleFonts.manrope(color: Colors.white),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: leagueController.wishlist.length,
          itemBuilder: (context, index) {
            final league = leagueController.wishlist[index];
            return Card(
              color: Color(0xff3b3c3b),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.grey.withOpacity(0.4),
              child: ListTile(
                leading: Image.network(
                  league.strBadge,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  league.strTeam,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(color: Colors.white),
                ),
                subtitle: Text(
                  league.strLeague,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    leagueController.toggleWishlist(league);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
