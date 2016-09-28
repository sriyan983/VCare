//
//  ProblemDetail.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemDetail.h"

@implementation ProblemDetail

- (instancetype)initWithProblemTitle:(NSString *)pTitle description:(NSString *)pDescription
                            category:(NSString *)pCategory location:(NSString *)pLocation
                                ID:(NSString *)pID votes:(NSString *)pVotes
                             hashTag:(NSString *)pHashTag;
{
    self = [super init];
    if (!self) return nil;
    
    _pTitle = [pTitle copy];
    _pDescription = [pDescription copy];
    _pCategory = [pCategory copy];
    _pLocation = [pLocation copy];
    _pID = [pID copy];
    _pVotes = [pVotes copy];
    _pHashTag = [pHashTag copy];
    return self;
}

@end
