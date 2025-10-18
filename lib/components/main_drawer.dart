import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem({
    IconData? icon,
    String? label,
    Color? color,
    Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 26, color: color),
      title: Text(
        label ?? 'Título',
        style: TextStyle(
          fontFamily: 'RoboCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final availabelHeight = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            height: availabelHeight * 0.16,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(bottom: 10, top: 30, left: 8),
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Tsubasa',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'Multiverse',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          _createItem(
            icon: Icons.sports_soccer,
            color: Colors.white,
            label: 'Jogadores',
            onTap:
                () =>
                    Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          _createItem(
            icon: Icons.settings,
            color: Colors.grey,
            label: 'Preferências',
            onTap:
                () => Navigator.of(
                  context,
                ).pushReplacementNamed(AppRoutes.preferences),
          ),
        ],
      ),
    );
  }
}
