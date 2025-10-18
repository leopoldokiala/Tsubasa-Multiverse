import 'package:flutter/material.dart';
import 'package:tsubasa_multiverse/components/main_drawer.dart';

import '../models/preferences.dart';

class PreferencesScreen extends StatefulWidget {
  final Function(Preferences) onPreferencesChanged;
  final Preferences preferences;
  const PreferencesScreen(
    this.onPreferencesChanged,
    this.preferences, {
    super.key,
  });

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  Preferences? preferences;

  @override
  void initState() {
    super.initState();
    preferences = widget.preferences;
  }

  Widget _creatSwitch({
    String? titile,
    String? subtitle,
    bool? value,
    Function(bool)? onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(
        titile ?? 'Título',
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text(subtitle ?? 'Subtítulo'),
      value: value ?? false,
      onChanged: (newValue) {
        onChanged!(newValue);
        widget.onPreferencesChanged(preferences!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Preferências',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _creatSwitch(
                    titile: 'Melhores Jogadores',
                    subtitle: 'Exibe apenas os melhores jogadores',
                    value: preferences!.isBestPlayer,
                    onChanged:
                        (value) => setState(() {
                          preferences!.isBestPlayer = value;
                        }),
                  ),
                  _creatSwitch(
                    titile: 'Companheiros de Tsubasa',
                    subtitle: 'Apenas os jogadores que jogaram com Tsubasa',
                    value: preferences!.isTsubasaTeammate,
                    onChanged:
                        (value) => setState(() {
                          preferences!.isTsubasaTeammate = value;
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
