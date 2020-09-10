class Operator {
  Operator({
    this.name,
    this.description,
    this.canUseGeneralPotentialItem,
    this.potentialItemId,
    this.team,
    this.displayNumber,
    this.tokenKey,
    this.appellation,
    this.position,
    this.tagList,
    this.displayLogo,
    this.itemUsage,
    this.itemDesc,
    this.itemObtainApproach,
    this.maxPotentialLevel,
    this.rarity,
    this.profession,
    this.trait,
  });
  final String name;
  final String description;
  final bool canUseGeneralPotentialItem;
  final String potentialItemId;
  final int team;
  final String displayNumber;
  final String tokenKey;
  final String appellation;
  final String position;
  final List<String> tagList;
  final String displayLogo;
  final String itemUsage;
  final String itemDesc;
  final String itemObtainApproach;
  final int maxPotentialLevel;
  final int rarity;
  final String profession;
  final Trait trait;
  // final List<Phases> phases;
  // final List<Skills> skills;
  // final List<Talents> talents;
  // final List<PotentialRank> potentialRank;

  factory Operator.fromJson(Map<String, dynamic> json) {
    var tagList = [];
    var trait;
    if (json['tagList'] == null) {
      tagList = [];
    } else {
      tagList = json['tagList'];
    }
    if (json['trait'] != null) {
      trait = Trait.fromJson(json['trait']);
    }

    return Operator(
      name: json['name'],
      description: json['description'],
      canUseGeneralPotentialItem: json['canUseGeneralPotentialItem'],
      potentialItemId: json['potentialItemId'],
      team: json['team'],
      displayNumber: json['displayNumber'],
      tokenKey: json['tokenKey'],
      appellation: json['appellation'],
      position: json['position'],
      tagList: tagList.cast<String>(),
      displayLogo: json['displayLogo'],
      itemUsage: json['itemUsage'],
      itemDesc: json['itemDesc'],
      itemObtainApproach: json['itemObtainApproach'],
      maxPotentialLevel: json['maxPotentialLevel'],
      rarity: json['rarity'],
      profession: json['profession'],
      trait: trait,
    );
  }
}

class Skills {
  Skills(
      {this.skillId,
      this.overridePrefabKey,
      this.overrideTokenKey,
      this.levelUpCostCond,
      this.unlockCond});
  final String skillId;
  final String overridePrefabKey;
  final String overrideTokenKey;
  final List<LevelUpCostCond> levelUpCostCond;
  final Condition unlockCond;
  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      skillId: json['skillId'],
      overridePrefabKey: json['overridePrefabKey'],
      overrideTokenKey: json['overrideTokenKey'],
      levelUpCostCond: json['levelUpCostCond'],
      unlockCond: json['unlockCond'],
    );
  }
}

class LevelUpCostCond {
  LevelUpCostCond(this.unlockCond, this.lvlUpTime, this.levelUpCost);
  final Condition unlockCond;
  final int lvlUpTime;
  final List<Material> levelUpCost;
}

class Trait {
  Trait({this.candidates});
  final List<Candidates> candidates;
  factory Trait.fromJson(Map<String, dynamic> json) {
    var jsonCandidates = json['candidates'] as List;
    List<Candidates> lstCandidates =
        jsonCandidates.map((e) => Candidates.fromJson(e)).toList();
    return Trait(
      candidates: lstCandidates,
    );
  }
}

class KeyValue {
  KeyValue({this.key, this.value});
  final String key;
  final double value;
  factory KeyValue.fromJson(Map<String, dynamic> json) {
    return KeyValue(
      key: json['key'],
      value: json['value'],
    );
  }
}

class Condition {
  Condition({this.phase, this.level});
  final int phase;
  final int level;
  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      phase: json['phase'],
      level: json['level'],
    );
  }
}

class Candidates {
  Candidates(
      {this.unlockCondition,
      this.requiredPotentialRank,
      this.blackboard,
      this.overrideDescripton,
      this.prefabKey,
      this.rangeId});
  final Condition unlockCondition;
  final int requiredPotentialRank;
  final List<KeyValue> blackboard;
  final String overrideDescripton;
  final String prefabKey;
  final String rangeId;
  factory Candidates.fromJson(Map<String, dynamic> json) {
    var jsonBlackboard = json['blackboard'] as List;
    List<KeyValue> lstBlackboard =
        jsonBlackboard.map((e) => KeyValue.fromJson(e)).toList();
    return Candidates(
      unlockCondition: Condition.fromJson(json['unlockCondition']),
      requiredPotentialRank: json['requiredPotentialRank'],
      blackboard: lstBlackboard,
      overrideDescripton: json['overrideDescripton'],
      prefabKey: json['prefabKey'],
      rangeId: json['rangeId'],
    );
  }
}

class Phases {
  Phases(
      {this.characterPrefabKey,
      this.rangeId,
      this.maxLevel,
      this.attributesKeyFrames,
      this.evolveCost});
  final String characterPrefabKey;
  final String rangeId;
  final int maxLevel;
  final List<AttributesKeyFrames> attributesKeyFrames;
  final List<Material> evolveCost;

  factory Phases.fromJson(Map<String, dynamic> json) {
    return Phases(
      characterPrefabKey: json['characterPrefabKey'],
      rangeId: json['rangeId'],
      maxLevel: json['maxLevel'],
      attributesKeyFrames: json['attributesKeyFrames'],
      evolveCost: json['evolveCost'],
    );
  }
}

class Material {
  Material({this.id, this.count, this.type});
  final String id;
  final int count;
  final String type;
  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['id'],
      count: json['count'],
      type: json['type'],
    );
  }
}

class AttributesKeyFrames {
  AttributesKeyFrames({this.level, this.data});
  final int level;
  final Data data;
  factory AttributesKeyFrames.fromJson(Map<String, dynamic> json) {
    return AttributesKeyFrames(
      level: json['level'],
      data: json['data'],
    );
  }
}

class Data {
  Data(
      {this.maxHp,
      this.atk,
      this.def,
      this.magicResistance,
      this.cost,
      this.blockCnt,
      this.moveSpeed,
      this.attackSpeed,
      this.baseAttackTime,
      this.respawnTime,
      this.hpRecoveryPerSec,
      this.spRecoveryPerSec,
      this.maxDeployCount,
      this.maxDeckStackCnt,
      this.tauntLevel,
      this.massLevel,
      this.baseForceLevel,
      this.stunImmune,
      this.silenceImmune,
      this.sleepImmune});
  final int maxHp;
  final int atk;
  final int def;
  final int magicResistance;
  final int cost;
  final int blockCnt;
  final int moveSpeed;
  final int attackSpeed;
  final int baseAttackTime;
  final int respawnTime;
  final int hpRecoveryPerSec;
  final int spRecoveryPerSec;
  final int maxDeployCount;
  final int maxDeckStackCnt;
  final int tauntLevel;
  final int massLevel;
  final int baseForceLevel;
  final bool stunImmune;
  final bool silenceImmune;
  final bool sleepImmune;
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      maxHp: json['maxHp'],
      atk: json['atk'],
      def: json['def'],
      magicResistance: json['magicResistance'],
      cost: json['cost'],
      blockCnt: json['blockCnt'],
      moveSpeed: json['moveSpeed'],
      attackSpeed: json['attackSpeed'],
      baseAttackTime: json['baseAttackTime'],
      respawnTime: json['respawnTime'],
      hpRecoveryPerSec: json['hpRecoveryPerSec'],
      spRecoveryPerSec: json['spRecoveryPerSec'],
      maxDeployCount: json['maxDeployCount'],
      maxDeckStackCnt: json['maxDeckStackCnt'],
      tauntLevel: json['tauntLevel'],
      massLevel: json['massLevel'],
      baseForceLevel: json['baseForceLevel'],
      stunImmune: json['stunImmune'],
      silenceImmune: json['silenceImmune'],
      sleepImmune: json['sleepImmune'],
    );
  }
}
