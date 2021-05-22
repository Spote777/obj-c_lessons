//
//  Bird.m
//  lesson4
//
//  Created by Павел Заруцков on 22.05.2021.
//

#import "Bird.h"

@implementation Bird

- (instancetype)initWithNumber:(NSInteger)number
{
    self = [super init];
    if (self) {
        NSLog(@"Bird created with number %d", number);
    }
    self.number = number;
    
    return self;
}

- (void)dealloc
{
    NSLog(@"Dealloc bird");
    
    [super dealloc];
}
@end
