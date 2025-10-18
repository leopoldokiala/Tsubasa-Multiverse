import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsubasa_multiverse/app_routes.dart';
import 'package:tsubasa_multiverse/data/dummy_players.dart';
import 'package:tsubasa_multiverse/screens/categorie_players_screen.dart';
import 'package:tsubasa_multiverse/screens/player_screen.dart';
import 'package:tsubasa_multiverse/screens/preferences_screen.dart';
import 'package:tsubasa_multiverse/screens/tabs_screen.dart';

import 'models/player.dart';
import 'models/preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Player> _availablePlayers = dummyPlayers;
  final List<Player> _favoritePlayer = [];
  // final textScale = MediaQuery.textScalerOf(context);

  Preferences preferences = Preferences(
    isBestPlayer: false,
    isTsubasaTeammate: false,
  );

  void _filterPlayers(Preferences preferences) {
    setState(() {
      _availablePlayers =
          dummyPlayers.where((player) {
            if (preferences.isBestPlayer && !player.isBestPlayer) {
              return false;
            }
            if (preferences.isTsubasaTeammate && !player.isTsubasaTeammate) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  void _toggleFavorite(Player player) {
    setState(() {
      _favoritePlayer.contains(player)
          ? _favoritePlayer.remove(player)
          : _favoritePlayer.add(player);
    });
  }

  bool isFavorite(Player player) {
    return _favoritePlayer.contains(player);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF005BAC),
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005BAC),
          primary: Colors.blue.shade900,
          secondary: Colors.red.shade700,
          onSecondary: const Color(0xFF005BAC),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.textScalerOf(context).scale(18),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF005BAC),
          foregroundColor: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          labelSmall: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
          labelMedium: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontFamily: 'RobotoCondensed',
          ),
          labelLarge: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(20),
            fontFamily: 'RobotoCondensed',
          ),
          titleLarge: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(35),
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
          ),
          titleMedium: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
          ),
          titleSmall: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        scaffoldBackgroundColor: Colors.blue.shade200,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      routes: {
        AppRoutes.home:
            (context) => TabsScreen(
              players: _availablePlayers,
              favoritePlayer: _favoritePlayer,
            ),
        AppRoutes.preferences:
            (context) => PreferencesScreen(_filterPlayers, preferences),
        AppRoutes.categorie:
            (context) => CategoriePlayersScreen(players: _availablePlayers),
        AppRoutes.detailPlayer:
            (context) => PlayerScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: isFavorite,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return TabsScreen(
              players: _availablePlayers,
              favoritePlayer: _favoritePlayer,
            );
          },
        );
      },
    );
  }
}
