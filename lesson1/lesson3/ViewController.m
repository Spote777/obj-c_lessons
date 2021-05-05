//
//  ViewController.m
//  lesson3
//
//  Created by Павел Заруцков on 30.04.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

typedef NS_ENUM(NSInteger, HumanGender) {
    Man,
    Woman
};

struct Human {
    NSString *name;
    NSInteger age;
    HumanGender gender;
};

typedef NS_ENUM(NSInteger, Operation) {
    Plus,
    Minus,
    Multiply,
    Divide
};

- (NSString*) formatOperation: (Operation) oper {
    switch (oper) {
        case Plus:
            return @"+";
        case Minus:
            return @"-";
        case Multiply:
            return @"*";
        case Divide:
            return @"/";
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // MARK: - calculation
    [self calculateWithOperator:Plus arg1:1 arg2:2];
    [self calculateWithOperator:Minus arg1:1 arg2:2];
    [self calculateWithOperator:Multiply arg1:1 arg2:2];
    [self calculateWithOperator:Divide arg1:1 arg2:2];
    
    NSArray* arr = [NSArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", nil];
    
    [self loopFmt:arr];
    
    [self human];
}

- (void)calculateWithOperator:(Operation)operator arg1: (NSInteger)arg1 arg2: (NSInteger) arg2 {
    CGFloat result;
    if (operator == Plus) {
        result = [self summA:arg1 andB:arg2];
    } else if (operator == Minus) {
        result = [self minusA:arg1 andB:arg2];
    } else if (operator == Multiply) {
        result = [self multiplyA:arg1 andB:arg2];
    } else if (operator == Divide) {
        result = [self divideA:arg1 andB:arg2];
    } else {
        result = 0;
    }
    
    [self formatOperation:operator arg1:arg1 arg2:arg2 result:result];
}

- (void) formatOperation: (Operation) operation arg1: (NSInteger) arg1 arg2: (NSInteger) arg2 result:(CGFloat) result {
    NSLog(@"OPERATION: %li %@ %li = %f", (long)arg1, [self formatOperation:operation], arg2, result);
}

- (CGFloat) summA: (NSInteger)a andB: (NSInteger) b {
    return a + b;
}

- (CGFloat) minusA: (NSInteger)a andB: (NSInteger) b {
    return a - b;
}

- (CGFloat) multiplyA: (NSInteger) a andB:(NSInteger) b {
    return a * b;
}

- (CGFloat) divideA: (NSInteger) a andB: (NSInteger) b {
    if (b == 0) {
        return 0;
    }
    
    return (CGFloat)a / (CGFloat)b;
}

- (void) loopFmt: (NSArray*) arr {
    NSLog(@"Print arr with for loop");
    for (NSInteger i = 0; i < arr.count - 1; i++) {
        NSLog(@"%@", arr[i]);
    }
    
    NSLog(@"Print arr with do while loop");
    
    if (arr.count == 0) {
        return ;
    }
    
    NSInteger i = 0;
    do {
        NSLog(@"%@", arr[i]);
        i++;
    } while(i < arr.count);
}

-(NSString*) formatGender: (HumanGender) gender {
    switch (gender) {
        case Man:
            return @"Man";
        case Woman:
            return @"Woman";
    }
}

- (void) human {
    struct Human human1;
    human1.name = @"Sam";
    human1.age = 29;
    human1.gender = Man;
    NSLog(@"Human name: %@, age: %ld, gender: %@", human1.name, (long)human1.age, [self formatGender:human1.gender]);
    
    struct Human human2;
    human2.name = @"Name2";
    human2.age = 39;
    human2.gender = Woman;
    NSLog(@"Human name: %@, age: %ld, gender: %@", human2.name, (long)human2.age, [self formatGender:human2.gender]);
}

@end
