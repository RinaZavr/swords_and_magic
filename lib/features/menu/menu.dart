final class Menu {
  const Menu();

  bool _checkEnter(int menu) {
    return menu < 0 || menu > 3;
  }

  /// Вывод меню
  void showMenu() {
    print('1.Новая игра');
    print('2.Загрузить игру');
    print('3.Выйти');

    print('\n');
  }

  void enterMune({
    required final int menuItem,
    required final Function() isStartNewGame,
    required final Function() isLoadGame,
    required final Function() isExitGame,
  }) {
    if (_checkEnter(menuItem)) {
      print('Вы ввели не правильный пункт меню!');
    } else if (menuItem == 1) {
      isStartNewGame();
    } else if (menuItem == 2) {
      isLoadGame();
    } else if (menuItem == 3) {
      isExitGame();
    }
  }
}
