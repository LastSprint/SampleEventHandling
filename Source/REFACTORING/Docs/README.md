#  Описание идеи рефакторинга

Основной интерфейс управления оставляем без изменений для упрощения миграции
AbstractStateManager = DataDisplayManager и образует общий интерфейс

Делегат и data source выделяем в отдельные сущности
Простейшая модификация (например поддержка **SelectableItem** или **FoldableItem**) достигается за счет подключения плагинов.
Случаи сложнее реакции на ивент делегата добавляются за счет наследования от базового делегата.

Базовый класс наследуется от AbstractStateManager или DataDisplayManager и конкретизирует assotiatedtype - тем самым привязавшись к view (таблице, коллекции или стеку)
Базовый класс не расширяем. Дополнительную логику: вставка, удаление, замена и тп добавляем наследовавшись от базового класса.

Доступ к билдеру менеджера с делегатами и датасорсом реализуем через **DataDisplayCompatible**. Это образует nameSpace чтобы можно было билдить по-красоте,  например **tableView.rddm.somebuilder.addSmth.build**

TODO генераторы тоже должны быть составными. Попробовать прокачать базовый генератор так, чтобы минимизировать количество наследников. Тут больше подойдет декоратор нежели builder. Привязать его можно в статический nameSpace **UITableViewCell.rddm.genrator.selectable.foldable...**

TODO чтобы анимация вставки или замены не вызывала проблем - этот процесс выделим в **Animator** - который будет работать только с IndexPath и правильным образом обновлять таблицу, чтобы минимизировать возможные баги и дать возможность заменить аниматор.

![TableDataDisplayManager](TableDataDisplayManager.png)