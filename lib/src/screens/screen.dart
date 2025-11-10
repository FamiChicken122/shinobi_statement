import 'package:flutter/widgets.dart';
import 'package:shinobi_statement/src/screens/character_screen.dart';
import 'package:shinobi_statement/src/screens/scenario_screen.dart';

enum Screen {
  scenario,
  character,
  publicInfo,
  secret,
  place,
  emotion,
  unwell,
  combatEffect;

  StatelessWidget get screenWidget => switch (this) {
    scenario => const ScenarioScreen(),
    character => const CharacterScreen(),
    _ => const ScenarioScreen(),
    // publicInfo => const PublicInfoScreen(),
    // secret => const SecretScreen(),
    // place => const PlaceScreen(),
    // emotion => const EmotionScreen(),
    // unwell => const UnwellScreen(),
    // combatEffect => const CombatEffectScreen(),
  };
}
