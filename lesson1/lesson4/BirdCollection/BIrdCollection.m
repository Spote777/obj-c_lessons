//
//  BIrdCollection.m
//  lesson4
//
//  Created by Павел Заруцков on 22.05.2021.
//

#import "BirdCollection.h"

@implementation BirdCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.collection = [NSMutableArray array];
    }
    return self;
}

- (void)addBird:(Bird *)bird
{
    [bird retain];
    [bird release];
    
    [_collection addObject:bird];
    
    NSLog(@"Add bird to collection. Count: %d", [self.collection count]);
}

- (void)dealloc
{
    for (Bird* bird in self.collection) {
        [bird release];
        NSLog(@"Release bird");
    }
    
    NSLog(@"Dealloc BirdCollection");
    
    [super dealloc];
}
@end
