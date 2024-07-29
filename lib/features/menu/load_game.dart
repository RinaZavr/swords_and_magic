import 'dart:convert';
import 'dart:io';

import 'package:swords_and_magic/features/player/player_const.dart';
import 'package:swords_and_magic/features/player/player_entity.dart';

/// Загрузка игры
bool loadGame() {
  // Создаем файл
  final file = File(PlayerConst.playerEntityJson);
  try {
    // Читаем json из файла
    final json = file.readAsStringSync();
    // Получаем Map из json
    final data = jsonDecode(json) as Map<String, dynamic>;
    // Добавляем полученный Map в playerEntity
    playerEntity.addAll(data);
    print("Игра успешно загружена...");
    // Возвращаем true при успешной загрузке
    return true;
  } catch (_) {
    // Возвращаем false при ошибке или при отсутствии сохранений
    print("Отсутствуют сохранения");
    return false;
  }
}
