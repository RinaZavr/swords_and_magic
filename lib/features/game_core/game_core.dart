import 'dart:io';

import 'package:swords_and_magic/features/menu/exit_game.dart';

gameCore() {
  print("Игра началась...");
  // Считываем данные из консоли
  final inputData = stdin.readLineSync();
  // Если введена команда exit, выходим из игры
  if (inputData == 'exit') {
    exitGame();
  }
}
