#!/bin/bash

# Компиляция программы
g++ -o factorial factorial.cpp || { echo "Compilation failed"; exit 1; }

# Тестовые случаи
test_cases=(
    "5:120"
    "6:720"
    "0:1"
    "-5:-1"
)

# Запуск тестов
for test in "${test_cases[@]}"; do
    input="${test%%:*}"
    expected="${test##*:}"
    
    # Если тест на отрицательное число, проверяем на stderr и код возврата
    if [ "$input" -lt "0" ]; then
        result=$(./factorial "$input" 2>&1)  # Перенаправляем stderr в stdout
        if [[ "$result" == *"Ошибка: факториал отрицательного числа не определён."* ]]; then
            echo "Test passed: '$input' -> $result"
        else
            echo "Test failed: '$input' -> $result (expected error)"
            exit 1
        fi
    else
        result=$(./factorial "$input" | awk '{print $NF}')  # Для других случаев, получаем последний вывод
        if [[ "$result" == "$expected" ]]; then
            echo "Test passed: '$input' -> $result"
        else
            echo "Test failed: '$input' -> $result (expected $expected)"
            exit 1
        fi
    fi
done

echo "All tests passed!"
