//
//  Student.m
//  lesson4
//
//  Created by Павел Заруцков on 21.05.2021.
//

#import "Student.h"

@interface Student ()
@property (readwrite) NSInteger age;
@end


@implementation Student

- (void) incrementAge {
    _age = _age + 1;
}

-(instancetype) initWithName:(NSString *)name surname:(NSString *)surname age:(NSInteger)age {
    self = [super init];
    self.name = name;
    self.surname = surname;
    self.age = age;
    
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _name, _surname];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ age %ld", [self fullName], _age];
}
@end
