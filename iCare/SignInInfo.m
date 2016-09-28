//
//  SignInInfo.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "SignInInfo.h"

@implementation SignInInfo

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password {
    self = [super init];
    if (!self) return nil;
    
    _email = [email copy];
    _password = [password copy];
    
    return self;
}

@end
