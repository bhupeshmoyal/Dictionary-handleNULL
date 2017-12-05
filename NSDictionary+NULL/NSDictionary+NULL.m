//
//  NSDictionary+NULL.h
//
//  Created by Bhupesh on 04/12/17.
//  Copyright © 2017 MSK. All rights reserved.
//

#import "NSDictionary+NULL.h"

@implementation NSDictionary (HandleNuLL)

- (NSDictionary *)dictionaryByReplacingNullsWithStrings {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary: self];
    NSString *nullString = @"";
    for (NSString *key in [dictionary allKeys]) {
        id value = dictionary[key];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            dictionary[key] = [(NSDictionary *) value dictionaryByReplacingNullsWithStrings];
            
        }else if([value isKindOfClass:[NSArray class]]){
            
            NSMutableArray *newArray = [value mutableCopy];
            
            [value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                id value2 = obj;
                
                if ([value2 isKindOfClass:[NSDictionary class]]) {
                    newArray[idx] = [(NSDictionary *) value2 dictionaryByReplacingNullsWithStrings];
                }
                else if ([value2 isKindOfClass:[NSNull class]]){
                    newArray[idx] = nullString;
                }
            }];

            dictionary[key] = newArray;
            
        }else if ([value isKindOfClass:[NSNull class]]){
            dictionary[key] = nullString;
        }
    }
    return dictionary;

}

@end
