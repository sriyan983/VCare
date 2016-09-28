//
//  Category.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemCategory : NSObject

@property (nonatomic, copy, readonly) NSString *cID;
@property (nonatomic, copy, readonly) NSString *cName;

- (instancetype)initWithID:(NSString *)cID name:(NSString *)cName;


@end
