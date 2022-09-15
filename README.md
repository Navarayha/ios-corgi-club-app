# ios-corgi-club-app

[![Tuist badge](https://img.shields.io/badge/Powered%20by-Tuist-blue)](https://tuist.io)

## Нужно убедиться что установлены

1. Tuist

```bash
curl -Ls https://install.tuist.io | bash
```

2. Brew

```bash
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/master/install.sh
```

3. CocoaPods

```bash
brew install CocoaPods
```

## Сборка всего проекта

1. ```bash
   git clone git@github.com:Navarayha/ios-corgi-club-app.git
   ```
2. войти в папку проекта
   ```bash
   cd ios-corgi-club-app
   ```
3. предоставить правда на испольнение для скрипта генерации проекта
   ```bash
   chmod +x generate-with-pods.sh
   ```
4. запустить генерацию проекта полностью
   ```bash
   ./generate-with-pods.sh
   ```
Далее должно открыться окно XCode.   

## Генерация проекта частично для разрабатываемого модуля

### Вариант когда модуль не требует CocoaPod зависимости

```bash
tuist generate xxxExampleApp
```

Где вместо xxx подставить название нужного модуля. Например, в случае с LoginUI будет выглядеть так:

```bash
tuist generate LoginUIExampleApp
```

После этого будет открыто окно XCode для разработки. Если что-то пошло не так - закрываем все окноа и повторяем
процедуру заново.

### Вариант когда требуются CocoaPods зависимости

Нужно просто указать название модуля для утилиты generate-with-pods.sh. В случае модуля LoginUI это будет выглядеть так:

```bash
./generate-with-pods.sh LoginUI
```

После этого будут закрыты все окна XCode. Сгенерен проект, как если бы была указана
команда `tuist generate LoginUIExampleApp`. После этого соотвествующим образом будут установлены Pods. В завершении
откроется XCode для редактирования.
