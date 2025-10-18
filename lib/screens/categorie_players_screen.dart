import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/components/card_player.dart';

import '../models/player.dart';

class CategoriePlayersScreen extends StatelessWidget {
  final List<Player> players;
  const CategoriePlayersScreen({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, // aumenta a largura máxima
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 3 / 3.8,
        ),
        children:
            players.map((p) {
              return CardPlayer(player: p);
            }).toList(),
      ),
    );
  }
}
