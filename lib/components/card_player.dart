import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/app_routes.dart';
import 'package:tsubasa_multiverse/models/player.dart';

class CardPlayer extends StatelessWidget {
  final Player player;
  final bool isFromPlayerScreen;

  const CardPlayer({
    super.key,
    required this.player,
    this.isFromPlayerScreen = false,
  });

  void _selectedCard(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacementNamed(AppRoutes.detailPlayer, arguments: player);
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        isFromPlayerScreen
            ? const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            )
            : BorderRadius.circular(16);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.onSecondary,
      onTap: () => _selectedCard(context),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),

        child: Card(
          elevation: 0,
          color: Color(0xFF005BAC),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                child: Image.network(
                  player.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                player.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
