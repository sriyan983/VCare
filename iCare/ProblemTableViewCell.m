//
//  ProblemTableViewCell.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemTableViewCell.h"

@implementation ProblemTableViewCell

- (IBAction)voteForProblem:(id)sender {
    [self.problemVoteDelegate voteForProblem:(int)self.tag];
}

- (IBAction)reportAbuse:(id)sender {
}
@end
