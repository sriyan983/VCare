//
//  Category.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemCategory.h"

@implementation ProblemCategory


- (instancetype)initWithID:(NSString *)cID name:(NSString *)cName
{
    self = [super init];
    if (!self) return nil;
    
    _cID = [cID copy];
    _cName = [cName copy];
    
    return self;
}


@end
