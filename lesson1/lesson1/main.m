//
//  main.m
//  lesson1
//
//  Created by Павел Заруцков on 18.04.2021.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        int firstSumInt = 0;
        int secondSumInt = 0;
        printf("Сумма двух чисел \nвведите первое число: ");
        scanf("%d", &firstSumInt);
        printf("введите второе число: ");
        scanf("%d", &secondSumInt);
        NSLog(@"Первое число - %d, Второе число - %d, Результат - %d", firstSumInt, secondSumInt, firstSumInt + secondSumInt );

        int firstSubtractInt = 0;
        int secondSubtractInt = 0;
        printf("Вычетание двух чисел \nвведите первое число: ");
        scanf("%d", &firstSubtractInt);
        printf("введите второе число: ");
        scanf("%d", &secondSubtractInt);
        NSLog(@"Первое число - %d, Второе число - %d, Результат - %d", firstSubtractInt, secondSubtractInt, firstSubtractInt - secondSubtractInt );

        int firstMultiInt = 0;
        int secondMultiInt = 0;
        printf("Произведение двух чисел \nвведите первое число: ");
        scanf("%d", &firstMultiInt);
        printf("введите второе число: ");
        scanf("%d", &secondMultiInt);
        NSLog(@"Первое число - %d, Второе число - %d, Результат - %d", firstMultiInt, secondMultiInt, firstMultiInt * secondMultiInt );

        double firstDivideInt = 0.0;
        double secondDivideInt = 0.0;
        printf("Деление двух чисел \nвведите первое число: ");
        scanf("%lf", &firstDivideInt);
        printf("введите второе число: ");
        scanf("%lf", &secondDivideInt);
        NSLog(@"Первое число - %f, Второе число - %f, Результат - %f", firstDivideInt, secondDivideInt, firstDivideInt / secondDivideInt );

        double firstNumber = 0;
        double secondNumber = 0;
        double theirdNumber = 0;
        int averageValue = 3;
        printf("Среднее значение 3 чисел \nвведите первое число: ");
        scanf("%lf", &firstNumber);
        printf("введите второе число: ");
        scanf("%lf", &secondNumber);
        printf("введите третье число: ");
        scanf("%lf", &theirdNumber);
        NSLog( @"%f",(firstNumber + secondNumber + theirdNumber) / averageValue );
    }
    return 0;
}
