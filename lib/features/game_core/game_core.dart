import 'dart:convert';
import 'dart:io';
import 'package:swords_and_magic/features/player/player_const.dart';
import 'package:swords_and_magic/features/player/player_entity.dart';

final class GameCore {
  PlayerEntity? playerEntity;

  GameCore({
    required this.playerEntity,
  });

  startGame() {
    print("Игра началась...");

    print(
        '${playerEntity?.playerName} Добро в мир Меча и Магии'); // Обращение через класс
    print('Ваш класс ${playerEntity?.playerClass}'); // Обращение через класс

    // Считываем данные из консоли
    final inputData = stdin.readLineSync();

    // Если введена команда exit, выходим из игры
    if (inputData == 'exit' || inputData == null || inputData.isEmpty) {
      exitGame();
    }
  }

  void exitGame() {
    // Создаем файл
    final file = File(PlayerConst.playerEntityJson);
    // Создаем json из playerEntity
    final json = jsonEncode(playerEntity?.toJson());
    try {
      // Записываем json в файл
      file.writeAsString(json);
      // Выводим сообщение о успешном сохранении
      print("Игра успешно сохранена");
    } on Object catch (err, st) {
      // Выводим сообщение об ошибке
      print("Ошибка сохранения: $err, $st");
    }

    print('Выходим из игры...');
    // Завершаем игру, присваиваем переменной [isRunGame] значение false
  }

  void loadGame() {
    // Создаем файл
    final file = File(PlayerConst.playerEntityJson);
    try {
      // Читаем json из файла
      final json = file.readAsStringSync();
      // Получаем Map из json
      final data = jsonDecode(json) as Map<String, dynamic>;
      // Добавляем полученный Map в playerEntity
      playerEntity = PlayerEntity.fromJson(data);
      print("Игра успешно загружена...");
      // Возвращаем true при успешной загрузке
      startGame();
    } catch (_) {
      // Возвращаем false при ошибке или при отсутствии сохранений
      print("Отсутствуют сохранения");
      newGame();
    }
  }

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

    playerEntity = PlayerEntity.create(
        inPlayerName: name ?? '', inPlayerClass: typeHero ?? '');

    startGame();
  }
}
