import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/data/dummy_players.dart';

import '../models/player.dart';

class RivalsListScreen extends StatelessWidget {
  const RivalsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context)!.settings.arguments as Player;

    return Scaffold(
      appBar: AppBar(title: Text('Rivals de: ${player.name}')),
      body: ListView.builder(
        itemCount: player.rivals.length,
        itemBuilder: (context, index) {
          final rivalName = player.rivals[index];
          final rivalPlayer = dummyPlayers.firstWhere(
            (riv) => riv.name == rivalName,
            orElse:
                () => Player(
                  id: 'not_found',
                  name: rivalName,
                  nickname: '',
                  nationality: '',
                  position: '',
                  team: '',
                  techniques: [],
                  rivals: [],
                  imageUrl: '',
                  isBestPlayer: false,
                  isTsubasaTeammate: false,
                ),
          );

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ), // menos espaço
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail_player',
                      arguments: rivalPlayer,
                    );
                  },
                  child: ListTile(
                    dense: true, // compacta verticalmente
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    leading:
                        rivalPlayer.imageUrl.isNotEmpty
                            ? CircleAvatar(
                              maxRadius: 26,
                              backgroundImage: NetworkImage(
                                rivalPlayer.imageUrl,
                              ),
                            )
                            : const Icon(Icons.person, size: 24),

                    title: Text(
                      rivalPlayer.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Conhecido por: ${rivalPlayer.nickname}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 12),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                  height: 8,
                ), // menos espaço entre os itens
              ],
            ),
          );
        },
      ),
    );
  }
}
