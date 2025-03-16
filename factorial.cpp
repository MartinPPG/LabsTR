#include <iostream>

using namespace std;

// Функция для вычисления факториала
long long factorial(int n) {
    if (n < 0) {
        cerr << "Ошибка: факториал отрицательного числа не определён." << endl;
        return -1;
    }
    long long result = 1;
    for (int i = 1; i <= n; ++i) {
        result *= i;
    }
    return result;
}

int main() {
    int n;
    cout << "Введите число: ";
    cin >> n;
    
    long long result = factorial(n);
    if (result != -1) {
        cout << "Факториал " << n << " = " << result << endl;
    }
    
    return 0;
}
