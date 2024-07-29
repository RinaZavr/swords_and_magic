import 'package:swords_and_magic/features/player/player_const.dart';
import 'package:swords_and_magic/features/spells/spells_const.dart';

final playerEntity = <String, dynamic>{};

final _playerWarrior = <String, dynamic>{
  PlayerConst.playerName: 'Warrior${DateTime.now().millisecondsSinceEpoch}',
  PlayerConst.playerClass: PlayerConst.warriorClass,
  PlayerConst.power: 10.0,
  PlayerConst.protection: 10.0,
  PlayerConst.lives: 100.0,
};

final _playerPaladin = <String, dynamic>{
  PlayerConst.playerName: 'Paladin${DateTime.now().millisecondsSinceEpoch}',
  PlayerConst.playerClass: PlayerConst.paladinClass,
  PlayerConst.power: 5.0,
  PlayerConst.protection: 5.0,
  PlayerConst.lives: 100.0,
  PlayerConst.mana: 50.0,
  PlayerConst.spells: <String>{SpellsConst.skyflare, SpellsConst.tendrilex, SpellsConst.stormix}
};

final _playerMagic = <String, dynamic>{
  PlayerConst.playerName: 'Magic${DateTime.now().millisecondsSinceEpoch}',
  PlayerConst.playerClass: PlayerConst.magicClass,
  PlayerConst.power: 0.0,
  PlayerConst.protection: 0.0,
  PlayerConst.lives: 100.0,
  PlayerConst.mana: 100.0,
  PlayerConst.spells: <String>{SpellsConst.earthlynx, SpellsConst.aquasphere, SpellsConst.sunweave, SpellsConst.typhunex, SpellsConst.whirlora}
};

void initPlayer({
  required String inPlayerName,
  required String inPlayerClass,
}) {
  switch (inPlayerClass) {
    case "2":
      playerEntity.addAll(_playerPaladin);
    case "3":
      playerEntity.addAll(_playerMagic);

    default:
      playerEntity.addAll(_playerWarrior);
  }
  if (inPlayerName != '') {
    playerEntity[PlayerConst.playerName] = inPlayerName;
  }
}
