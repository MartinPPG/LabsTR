#!/bin/bash

# Компиляция программы
g++ -o factorial factorial.cpp || { echo "Compilation failed"; exit 1; }

# Массив тестовых случаев
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
    result=$(./factorial "$input")

    # Извлечение числового результата из вывода
    extracted_result=$(echo "$result" | grep -o '[0-9-]\+')

    if [[ "$extracted_result" == "$expected" ]]; then
        echo "Test passed: '$input' -> $extracted_result"
    else
        echo "Test failed: '$input' -> $extracted_result (expected $expected)"
        exit 1
    fi
done

echo "All tests passed!"
