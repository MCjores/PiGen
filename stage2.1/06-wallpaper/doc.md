# Фон рабочего стола
Для отображения фона рабочего стола используется пакет "feh"

Изображение в формате PNG размещается в директории
_"/usr/share/amplituda/wallpaper.png"_. Установка фона производится
автоматически при каждом входе в систему. Для этого в файл
_"/home/pi/.config/openbox/autostart"_ добавлена строка:
```
feh --bg-fill /usr/share/amplituda/wallpaper.png &
```