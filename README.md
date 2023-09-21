# cardvival
## О проекте
**Cardvival** — игра в жанре выживание основанная на механиках игральных карт, в которой тебе предстоит взаимодействовать с заброшенным людьми островом, на который тебя забросила волна после кораблекрушения.
_Добывай ресурсы, исследуй свой остров (скоро будет), возводи сооружения (тоже скоро) и создавай предметы (и это тоже (игра же в альфе ещё, ну!))!_
- [Ссылка на Telegram канал автора игры](t.me/natsunokaze)

> Моя игра находится в очень ранней стадии разработки, может быть нестабильна и отличаться от итоговой её версии. Если вы заходите модифицировать код игры, готовьтесь к отсутствию комментариев в некоторых скриптах — сейчас плохой код пишется с целью реализовать то, что может зацепить игрока, как можно быстрее.
>
> Если вы нашли баг, дайте знать о нём в разделе "Issues" репозитория игры. Спасибо.

#### Управление
- ЛКМ (левая кнопка мыши) — взаимодействие
- ПКМ (правая кнопка мыши) — убрать предмет под курсором в рюкзак

#### Консольные команды
В игре есть консоль, кстати! Вы можете активировать её нажатием кнопки "[~]"
| Команда       | Аргументы                  | Описание                                      |
|:--------------|:---------------------------|:----------------------------------------------|
| quit          | Нет                        | Проосто закрывает игру.                       |
| echo          | [Текст]                    | Выводит на экран сообщение.                    |
| spawn_card    | [tool\|location\|resource] | Создаёт карту указанного типа.                 |
| remove_card   | Нет                        | Удаляет карту под курсором мыши.               |
| clear         | Нет                        | Очищает консоль от всех выводов.               |
| lab           | Нет                        | Отправляет вас в лабораторию/тестовую комнату со всяким. |



#### Системные требования
Исходя из тестов, рекомендуемыми системными требованиями являются:
| ОС       | Версия                     | Процессор       | Оперативная память | Жёсткий диск     |
|:---------|:---------------------------|:----------------|:-------------------|:-----------------|
| Windows  | 10, 11  для x64 процессоров. | 1.83 GHz x2.    | 200 МБ и больше.    | 200 МБ и больше.  |

## Как создать свой Cardvival?
1. Установите Godot Engine 4 (v 4.1.1)
2. Измените что-то на собственное усмотрение
3. Соберите игру под необходимую платформу, нажав на кнопку "Экспорт" в разделе "Проект"
> Помогайте улучшать Cardvival! Создавайте Pull request со своими изменениями — мы обязательно их рассмотрим!

`print("Made by Natsu and others w/ ❤️")`
