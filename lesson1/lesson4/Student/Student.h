//
//  Student.h
//  lesson4
//
//  Created by Павел Заруцков on 21.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

//MARK: - Properties
@property NSString *name;
@property NSString *surname;
@property (readonly) NSInteger age;


- (void) incrementAge;
- (instancetype) initWithName: (NSString*)name surname: (NSString*) surname age:(NSInteger) age;
- (NSString*) fullName;

@end

NS_ASSUME_NONNULL_END
