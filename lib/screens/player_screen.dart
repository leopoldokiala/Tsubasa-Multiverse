import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/components/card_player.dart';
import 'package:tsubasa_multiverse/components/main_drawer.dart';
import 'package:tsubasa_multiverse/components/player_detail_card.dart';
import 'package:tsubasa_multiverse/models/player.dart';

class PlayerScreen extends StatefulWidget {
  final Function(Player) onToggleFavorite;
  final bool Function(Player) isFavorite;

  const PlayerScreen({
    super.key,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context)!.settings.arguments as Player;

    final appBar = AppBar(
      title: Text(player.name),
      actions: [
        IconButton(
          splashColor: Theme.of(context).colorScheme.onSecondary,
          onPressed: () {
            widget.onToggleFavorite(player);
          },
          icon: Icon(
            Icons.favorite,
            color: widget.isFavorite(player) ? Colors.red : Colors.white,
            size: 32,
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      drawer: const MainDrawer(),
      appBar: appBar,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            final availableHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: availableHeight * 0.57,
                    child: CardPlayer(player: player, isFromPlayerScreen: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Container(
                      width: double.infinity,
                      height: availableHeight * 0.35,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: PlayerDetailCard(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
