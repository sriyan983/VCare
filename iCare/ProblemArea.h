//
//  Area.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemArea : NSObject

@property (nonatomic, copy, readonly) NSString *aID;
@property (nonatomic, copy, readonly) NSString *aName;

- (instancetype)initWithID:(NSString *)aID name:(NSString *)aName;


@end
