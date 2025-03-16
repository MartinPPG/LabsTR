# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Установим необходимые зависимости для работы с .deb пакетом
RUN apt-get update && apt-get install -y dpkg

# Копируем собранный .deb пакет из артефакта в контейнер
COPY lab1.deb /tmp/

# Устанавливаем .deb пакет
RUN dpkg -i /tmp/lab1.deb && apt-get -f install -y

# Указываем точку входа для контейнера
ENTRYPOINT ["/usr/local/bin/lab1"]
