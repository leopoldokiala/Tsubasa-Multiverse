import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../models/player.dart';
import '../screens/rivals_list_screen.dart';

class PlayerDetailCard extends StatelessWidget {
  const PlayerDetailCard({super.key});

  void _rivalsList(BuildContext context, Player player) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RivalsListScreen(),
        settings: RouteSettings(arguments: player),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context)!.settings.arguments as Player;

    final availableHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfo('Apelido', player.nickname, context),
          _buildInfo('Nacionalidade', player.nationality, context),
          _buildInfo('Equipa', player.team, context),
          _buildInfo('Posição', player.position, context),
          _buildInfo('Técnicas', player.techniques.join(', '), context),

          InkWell(
            onTap: () => _rivalsList(context, player),
            child: SizedBox(
              height: availableHeight * 0.04,
              child: Row(
                children: [
                  Text(
                    'Rivais: ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Expanded(
                    child: Marquee(
                      text: ' ${player.rivals.join(', ')}',
                      style: Theme.of(context).textTheme.titleSmall,
                      accelerationCurve: Curves.linear,
                      accelerationDuration: Duration(milliseconds: 700),
                      velocity: 50.0,
                      blankSpace: 20.0,
                      pauseAfterRound: Duration(seconds: 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String label, String text, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $text', style: Theme.of(context).textTheme.titleSmall),
        const Divider(),
      ],
    );
  }
}
