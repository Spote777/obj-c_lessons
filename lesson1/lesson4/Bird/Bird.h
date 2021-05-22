//
//  Bird.h
//  lesson4
//
//  Created by Павел Заруцков on 22.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bird : NSObject
@property NSInteger number;

- (instancetype) initWithNumber: (NSInteger) number;
@end

NS_ASSUME_NONNULL_END
