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
    result=$(./factorial "$input" | awk '{print $NF}')  # Берем последнее слово из вывода

    if [[ "$result" == "$expected" ]]; then
        echo "Test passed: '$input' -> $result"
    else
        echo "Test failed: '$input' -> $result (expected $expected)"
        exit 1
    fi
done

echo "All tests passed!"
