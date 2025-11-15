import 'package:flutter/widgets.dart';

import 'character_screen.dart';
import 'scenario_screen.dart';

enum Screen {
  scenario,
  character,
  publicInfo,
  secret,
  place,
  ougi,
  emotion,
  unwell,
  combatEffect;

  StatelessWidget get screenWidget => switch (this) {
    scenario => const ScenarioScreen(),
    character => const CharacterScreen(),
    _ => const CharacterScreen(),
    // publicInfo => const PublicInfoScreen(),
    // secret => const SecretScreen(),
    // place => const PlaceScreen(),
    // ougi => const OugiScreen(),
    // emotion => const EmotionScreen(),
    // unwell => const UnwellScreen(),
    // combatEffect => const CombatEffectScreen(),
  };

  String get shownName => switch (this) {
    scenario => 'シナリオ選択',
    character => 'キャラクター',
    publicInfo => '公開情報',
    secret => '秘密所持表',
    place => '居所所持表',
    ougi => '奥義情報所持表',
    emotion => '感情所持表',
    unwell => '変調所持表',
    combatEffect => '戦闘中データ',
  };

  String get paneTitle => switch (this) {
    scenario => 'シナリオ',
    character => 'キャラクター',
    publicInfo => '公開情報',
    secret => '秘密',
    place => '居所',
    ougi => '奥義情報',
    emotion => '感情',
    unwell => '変調',
    combatEffect => '戦闘データ',
  };
}
