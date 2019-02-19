# Введение
Данный проект сборки ОС для Raspberry Pi основывается на официальной
системе сборки [pi-gen](https://github.com/RPi-Distro/pi-gen).

Сборка образа ОС осуществляется путём последовательного выполнения
этапов, описываемых в директориях вида "stage[номер]". Каждый этап описывает
действия, применяемые к результату предыдущего. Изначально система
сборки уже содержала шаги от 0 до 4. Для сохранения совместимости с
официальной системой сборки, было принято решение о добавлении своего
функционала в виде дополнительных промежуточных этапов. Порядок выполнения определяется лексикографически.

## Дополнительные функции
* Скрытие отладочной информации при загрузке
* Автоматическое монтирование съёмных носителей
* Минимальное графическое окружение
* Автоматический вход в систему
* Скрытие курсора
* Запрет гашения экрана
* Фирменный фон рабочего стола
* Устойчивость к перебоям питания
* Резервное копирование на съёмный носитель

## Этапы сборки системы
|           Этап            |                                              Назначение                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| stage0                    | Создание файловой системы                                                                               |
| stage1                    | Минимальная загружающаяся система                                                                       |
| stage2                    | Облегчённая система с поддержкой Wi-Fi, Bluetooth                                                       |
| stage2.1                  | Базовая система для киоска. Содержит графическое окружение, экранную клавиатуру, резервное копирование  |
| stage2.2                  | Поддержка программ на языке C# (Mono Runtime)                                                           |
| stage2.3d                 | Отладочная версия системы. Удалённый доступ и служебная информация на экране                            |
| stage3                    | Полноценная среда рабочего стола. Содержит прикладные программы                                         |
| stage3_[название прибора] | Специализированная версия под конкретный прибор                                                         |
| stage4                    | Дополнительное прикладное ПО: среды разработки, учебные программы и т.д.                                |