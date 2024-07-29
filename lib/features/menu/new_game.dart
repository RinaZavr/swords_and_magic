import 'dart:io';

import 'package:swords_and_magic/features/game_core/game_core.dart';
import 'package:swords_and_magic/features/player/player_const.dart';
import 'package:swords_and_magic/features/player/player_entity.dart';

/// Новая игра
void newGame() {
  print('Новая игра...');

  /// Имя главного героя
  print('Введите имя главного героя:');
  final name = stdin.readLineSync();

  /// Класс главного героя
  print('''
Выберите класс игрока, введите число от 1 до 3: 
1.Воин
2.Паладин
3.Маг
''');
  final typeHero = stdin.readLineSync();

  initPlayer(inPlayerName: name ?? '', inPlayerClass: typeHero ?? '');

  print('${playerEntity[playerName]} Добро в мир Меча и Магии');
  print('Ваш класс ${playerEntity[playerClass]}');
  // Запускаем ядро игры
  gameCore();
}
