.PHONY: all build test clean deb

# Имя программы
TARGET = lab1

# Путь к исходным файлам
SRCS = ./*.cpp

# Путь к директории для сборки
BUILD_DIR = ./build

# Дефолтные зависимости
DEPS = g++ make dpkg

# Проверка и установка зависимостей
install_deps:
	@echo "Проверка и установка зависимостей..."
	@for dep in $(DEPS); do \
		if ! command -v $$dep &> /dev/null; then \
			echo "$$dep не установлен, устанавливаем..."; \
			sudo apt-get update && sudo apt-get install -y $$dep; \
		else \
			echo "$$dep уже установлен"; \
		fi \
	done

# Тест программы
test: install_deps
	@echo "Запуск тестов..."
	@bash test.sh

# Сборка программы
build: install_deps
	@echo "Сборка программы..."
	@mkdir -p $(BUILD_DIR)
	@g++ $(SRCS) -o $(BUILD_DIR)/$(TARGET)

# Очистка проекта
clean:
	@echo "Очистка временных файлов..."
	@rm -f $(BUILD_DIR)/$(TARGET)

# Сборка .deb пакета
deb: install_deps
	@echo "Сборка .deb пакета..."
	@mkdir -p lab1/usr/bin
	@cp $(BUILD_DIR)/$(TARGET) lab1/usr/bin/$(TARGET)
	@mkdir -p lab1/DEBIAN
	@echo "Package: $(TARGET)" > lab1/DEBIAN/control
	@echo "Version: 1.0" >> lab1/DEBIAN/control
	@echo "Architecture: amd64" >> lab1/DEBIAN/control
	@echo "Maintainer: *** <***>" >> lab1/DEBIAN/control
	@echo "Description: ***" >> lab1/DEBIAN/control
	@dpkg-deb --build lab1
	@rm -rf factorial
