//
//  ProblemDetail.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemDetail : NSObject

@property (nonatomic, copy, readonly) NSString *pID;
@property (nonatomic, copy, readonly) NSString *pTitle;
@property (nonatomic, copy, readonly) NSString *pDescription;
@property (nonatomic, copy, readonly) NSString *pCategory;
@property (nonatomic, copy, readonly) NSString *pLocation;
@property (nonatomic, copy) NSString *pVotes;
@property (nonatomic, copy, readonly) NSString *pHashTag;

- (instancetype)initWithProblemTitle:(NSString *)pTitle description:(NSString *)pDescription
                            category:(NSString *)pCategory location:(NSString *)pLocation
                                  ID:(NSString *)pID votes:(NSString *)pVotes
                            hashTag:(NSString *)pHashTag;

@end
