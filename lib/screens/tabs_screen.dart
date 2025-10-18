import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/components/main_drawer.dart';
import 'package:tsubasa_multiverse/screens/categorie_players_screen.dart';
import 'package:tsubasa_multiverse/screens/favorite_players_screens.dart';

import '../models/player.dart';

class TabsScreen extends StatefulWidget {
  final List<Player> players;
  final List<Player> favoritePlayer;
  const TabsScreen({
    super.key,
    required this.players,
    required this.favoritePlayer,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Tsubasa Multiverse',
        'screen': CategoriePlayersScreen(players: widget.players),
      },
      {
        'title': 'Meus Jogadores Favoritos',
        'screen': FavoritePlayersScreens(favoritePlayer: widget.favoritePlayer),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['title'] as String),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          //type: BottomNavigationBarType.shifting,
          selectedLabelStyle: TextStyle(fontSize: 18, color: Colors.white),
          unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.white),
          selectedIconTheme: Theme.of(context).iconTheme,
          unselectedIconTheme: Theme.of(context).iconTheme,
          onTap: (value) => _selectScreen(value),
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Jogadores',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
