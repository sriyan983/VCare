//
//  SignInInfo.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignInInfo : NSObject

@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, copy, readonly) NSString *password;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password;

@end
