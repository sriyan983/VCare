//
//  ProblemVotingDelegate.h
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProblemVotingDelegate <NSObject>

@required
- (void)voteForProblem:(int)problemID;

@end
