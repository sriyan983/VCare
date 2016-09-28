//
//  SignInViewModel.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "SignInViewModel.h"

@interface SignInViewModel ()

@property (nonatomic, strong, readonly) SignInInfo *signInInfo;

@end

@implementation SignInViewModel

- (instancetype)initWithStore:(SignInInfo *)signInInfo {
    self = [super init];
    if (!self) return nil;
    
    _signInInfo = signInInfo;
    
    return self;
}

- (BOOL)validateUser
{
    NSLog(@"Email - %@", _signInInfo.email);
    NSLog(@"Password - %@", _signInInfo.password);
    return  YES;
}

@end
