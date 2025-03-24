#include <iostream>
#include <cstdlib> // Для преобразования строки в число

using namespace std;

// Функция для вычисления факториала
long long factorial(int n) {
    if (n < 0) {
        cerr << "Ошибка: факториал отрицательного числа не определён." << endl;
        return -1;  // Возвращаем -1, чтобы обозначить ошибку
    }
    long long result = 1;
    for (int i = 1; i <= n; ++i) {
        result *= i;
    }
    return result;
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cout << "Ошибка: требуется один аргумент (число для вычисления факториала)." << endl;
        return 1;
    }

    int n = atoi(argv[1]); // Преобразуем строку в число

    long long result = factorial(n);
    if (result != -1) {
        cout << "Факториал " << n << " = " << result << endl;
    } else {
        // Мы уже выводим ошибку через cerr в функции factorial
        return 1;  // Возвращаем ошибку, если факториал не был вычислен
    }

    return 0;
}
