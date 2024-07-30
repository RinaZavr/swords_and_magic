import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:swords_and_magic/features/player/player_const.dart';
import 'package:swords_and_magic/features/player/player_entity.dart';

final class GameCore {
  PlayerEntity? playerEntity;

  GameCore({
    required this.playerEntity,
  });

  late final StreamSubscription<String> subscription;

  startGame() {
    print("Игра началась...");

    print(
        '${playerEntity?.playerName} Добро в мир Меча и Магии'); // Обращение через класс
    print('Ваш класс ${playerEntity?.playerClass}'); // Обращение через класс

    subscription = stdin.transform(utf8.decoder).listen((event) {
      if (event.contains('exit')) {
        subscription.cancel();
        exitGame();
      }
    });
  }

  void exitGame() async {
    // Создаем файл
    final file = File(PlayerConst.playerEntityJson);
    // Создаем json из playerEntity
    final json = jsonEncode(playerEntity?.toJson());
    print("Игра сохраняется...");
    // Записываем json в файл
    await file.writeAsString(json).then((_) {
// Выводим сообщение о успешном сохранении
      print("Игра успешно сохранена");
    }).onError((error, stackTrace) {
      // Выводим сообщение об ошибке
      print("Ошибка сохранения: $error, $stackTrace");
    });
    print('Выходим из игры...');
    exit(0);
  }

  void loadGame() async {
    // Создаем файл
    final file = File(PlayerConst.playerEntityJson);
    // Читаем json из файла
    await file.readAsString().then(
      (value) {
        // Получаем Map из json
        final data = jsonDecode(value) as Map<String, dynamic>;
        // Добавляем полученный Map в playerEntity
        playerEntity = PlayerEntity.fromJson(data);
        print("Игра успешно загружена...");
        // Возвращаем true при успешной загрузке
        startGame();
      },
    ).onError((error, stackTrace) {
      // Возвращаем false при ошибке или при отсутствии сохранений
      print("Отсутствуют сохранения");
      newGame();
    });
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
