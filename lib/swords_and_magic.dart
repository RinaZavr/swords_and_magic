import 'dart:io';

import 'package:swords_and_magic/features/game_core/game_core.dart';
import 'package:swords_and_magic/features/menu/menu.dart';
import 'package:swords_and_magic/features/player/player_entity.dart';

PlayerEntity? playerEntity;

Menu mainMenu = const Menu();

GameCore gameCore = GameCore(playerEntity: playerEntity);

void startGame() {
  mainMenu.showMenu();
  // Приводим строку к типу int
  final int menuItem = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  mainMenu.enterMune(
    menuItem: menuItem,
    isStartNewGame: () => gameCore.newGame(),
    isLoadGame: () => gameCore.loadGame(),
    isExitGame: () => gameCore.exitGame(),
  );
}
