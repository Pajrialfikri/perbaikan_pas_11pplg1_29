import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perbaikan_pas_11pplg1_29/Controllers/league_controller.dart';
import 'package:perbaikan_pas_11pplg1_29/models/league_model.dart';

class MyLeagueCard extends StatelessWidget {
  final LeagueModel leagueModel;
  final LeagueController leagueController;
  final VoidCallback onCardTap;

  const MyLeagueCard({
    super.key,
    required this.leagueModel,
    required this.leagueController,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Card(
        color: const Color(0xff3b3c3b),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.4),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              leagueModel.strBadge,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 50),
            ),
          ),
          title: Text(
            leagueModel.strTeam,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.manrope(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            leagueModel.strLeague,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.manrope(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              leagueController.isWishlisted(leagueModel);
              leagueController.toggleWishlist(leagueModel);
            },
            child: Obx(() {
              final isWishlisted = leagueController.isWishlisted(leagueModel);
              return Icon(
                isWishlisted ? Icons.favorite : Icons.favorite_border,
                color: isWishlisted ? const Color(0xfff24236) : const Color(0xff585958),
              );
            }),
          ),
        ),
      ),
    );
  }
}
