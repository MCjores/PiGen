# Удалённый отладчик
Для развёртывания и отладки программ из Visual Studio на
Raspberry Pi устанавливается отладчик
[MonoRemoteDebugger](https://github.com/techl/MonoRemoteDebugger).
Вместе с установкой отладчика включается доступ к системе по
протоколу SSH.

## Установка
Процедура установки включает в себя:
- Загрузка архива с сайта разработчика
- Распаковка архива в директорию _"/usr/lib/MonoRemoteDebugger.Server/"_
- Изменение прав доступа для данной директории на 1000:1000
- Установка файла "mono-remote-debugger" в директорию _"/usr/bin/"_
- Запись в файл _"/home/pi/.config/openbox/autostart"_ строки
```
mono-remote-debugger &
```

Таким образом пользователь отладчик будет запускаться автоматически
при входе пользователя pi (id=1000) в систему.

## Включение SSH
```
systemctl enable ssh
```