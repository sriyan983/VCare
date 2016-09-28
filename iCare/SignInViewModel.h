//
//  SignInViewModel.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignInInfo.h"

@interface SignInViewModel : NSObject

- (instancetype)initWithStore:(SignInInfo *)signInInfo;
- (BOOL)validateUser;

@end
