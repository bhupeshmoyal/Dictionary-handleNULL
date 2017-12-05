//
//  NSDictionary+NULL.h
//
//  Created by Bhupesh on 04/12/17.
//  Copyright © 2017 MSK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HandleNuLL)
- (NSDictionary *)dictionaryByReplacingNullsWithStrings;
@end
