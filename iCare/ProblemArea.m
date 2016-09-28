//
//  Area.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemArea.h"

@implementation ProblemArea

- (instancetype)initWithID:(NSString *)aID name:(NSString *)aName
{
    self = [super init];
    if (!self) return nil;
    
    _aID = [aID copy];
    _aName = [aName copy];
    
    return self;
}

@end
