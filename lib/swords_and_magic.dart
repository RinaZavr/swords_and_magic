import 'dart:io';

import 'package:swords_and_magic/features/game_core/game_core.dart';
import 'package:swords_and_magic/features/menu/load_game.dart';
import 'package:swords_and_magic/features/menu/exit_game.dart';
import 'package:swords_and_magic/features/menu/new_game.dart';
import 'package:swords_and_magic/features/player/player_const.dart';
import 'package:swords_and_magic/features/player/player_entity.dart';

bool isRunGame = true;

void startGame() {
  while (isRunGame) {
    _game();
  }
}

void _game() {
  /// Меню
  _showMenu();
  print('Введите необходимый пункт: ');
  // Приводим строку к типу int
  final int menu = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  if (_checkEnter(menu)) {
    print('Вы ввели не правильный пункт меню!');
  } else if (menu == 1) {
    newGame();
  } else if (menu == 2) {
    ///////////////////// Новое

    // Проверяем наличие сохранений, пытаемся загрузить игру
    if (loadGame()) {
      // Если загрузка прошла успешно, выводим сообщение
      print('${playerEntity[PlayerConst.playerName]} Добро в мир Меча и Магии');
      print('Ваш класс ${playerEntity[PlayerConst.playerClass]}');
      // Запускаем ядро игры
      gameCore();
    } else {
      // Если загрузка не удалась, начинаем новую игру
      newGame();
    }
    ///////////////////// Новое
  } else if (menu == 3) {
    exitGame();
  }
}

/// Проверяем на правильность ввода пункта меню
bool _checkEnter(int menu) {
  return menu < 0 || menu > 3;
}

/// Вывод меню
void _showMenu() {
  print('1.Новая игра');
  print('2.Загрузить игру');
  print('3.Выйти');

  print('\n');
}
