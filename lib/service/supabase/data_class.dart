class Scenario {
  const Scenario({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}

class Character {
  const Character({
    required this.id,
    required this.scenarioId,
    required this.name,
    required this.isPc,
    required this.hasSecret,
    required this.hasLocation,
    required this.hasEmotion,
    required this.isPublic,
    this.secretDetail,
    this.sheetUrl,
  });

  final int id;
  final int scenarioId;
  final String name;
  final bool isPc;
  final bool hasSecret;
  final bool hasLocation;
  final bool hasEmotion;
  final bool isPublic;
  final String? secretDetail;
  final String? sheetUrl;
}

class Emotion extends _Infomation {
  const Emotion({
    required super.id,
    required super.holdCharacterId,
    required super.heldCharacterId,
    required this.emotionId,
  });
  final int emotionId;
}

class Secret extends _Infomation {
  const Secret({
    required super.id,
    required super.holdCharacterId,
    required super.heldCharacterId,
  });
}

class Ougi extends _Infomation {
  const Ougi({
    required super.id,
    required super.holdCharacterId,
    required super.heldCharacterId,
  });
}

class Location extends _Infomation {
  const Location({
    required super.id,
    required super.holdCharacterId,
    required super.heldCharacterId,
  });
}

class Unwell {
  const Unwell({
    required this.id,
    required this.characterId,
    required this.unwellsListId,
    required this.paralyzedSkillId,
    required this.cursedNinpoName,
  });

  final int id;
  final int characterId;
  final int unwellsListId;
  final int paralyzedSkillId;
  final String cursedNinpoName;
}

class CombatEffect {
  const CombatEffect({
    required this.id,
    required this.characterId,
    required this.name,
    required this.detail,
  });

  final int id;
  final int characterId;
  final String name;
  final String detail;
}

class EmotionsList {
  const EmotionsList({
    required this.id,
    required this.isPlus,
    required this.name,
  });

  final int id;
  final bool isPlus;
  final String name;
}

class SkillsList {
  const SkillsList({
    required this.id,
    required this.field,
    required this.name,
  });

  final int id;
  final String field;
  final String name;
}

class UnwellsList {
  const UnwellsList({
    required this.id,
    required this.name,
    required this.function,
    required this.refreshSkillId,
    required this.isSengoku,
  });

  final int id;
  final String name;
  final String function;
  final int refreshSkillId;
  final bool isSengoku;
}

class _Infomation {
  const _Infomation({
    required this.id,
    required this.holdCharacterId,
    required this.heldCharacterId,
  });

  final int id;
  final int holdCharacterId;
  final int heldCharacterId;
}
