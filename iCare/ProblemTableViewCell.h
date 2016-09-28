//
//  ProblemTableViewCell.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemVotingDelegate.h"

@interface ProblemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *problemDescriptionLbl;
@property (weak, nonatomic) IBOutlet UILabel *voteNumbersLbl;
@property (weak, nonatomic) IBOutlet UILabel *problemTitleLbl;
@property (weak, nonatomic) IBOutlet UILabel *problemHashTagLbl;
@property (weak, nonatomic) id<ProblemVotingDelegate> problemVoteDelegate;

- (IBAction)voteForProblem:(id)sender;
- (IBAction)reportAbuse:(id)sender;
@end
