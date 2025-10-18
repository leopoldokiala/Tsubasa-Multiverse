import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/components/card_player.dart';
import 'package:tsubasa_multiverse/models/player.dart';

class FavoritePlayersScreens extends StatelessWidget {
  final List<Player> favoritePlayer;
  const FavoritePlayersScreens({super.key, required this.favoritePlayer});

  @override
  Widget build(BuildContext context) {
    if (favoritePlayer.isEmpty) {
      return Center(
        child: Text(
          'Nenhum jogador Favorito ainda',
          style: Theme.of(context).primaryTextTheme.labelLarge,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritePlayer.length,
        itemBuilder: (context, index) {
          final myFavoritePlayer = favoritePlayer[index];
          return CardPlayer(player: myFavoritePlayer);
        },
      );
    }
  }
}
