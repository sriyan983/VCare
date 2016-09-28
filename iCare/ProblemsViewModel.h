//
//  ProblemsViewModel.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProblemDetail.h"
#import "ProblemTableViewCell.h"

@interface ProblemsViewModel : NSObject
@property (nonatomic, strong) ProblemDetail *problemDetail;

- (instancetype)init;
- (instancetype)initWithStore:(ProblemDetail *) problemDetail;
- (void) setProblemDetailToCell: (ProblemTableViewCell *)cell problemVotingDelegate:(id<ProblemVotingDelegate>) problemVotingDelegate;
- (void) setProblemTitle:(UILabel *)pTitleLabel titleDescription:(UITextView *)pTitleDescriptionTextView hashTag:(UILabel *)pHashTagLabel;
- (void) setProblemActionToCell: (UITableViewCell *)cell row:(NSInteger)row;
- (NSInteger) numberOfProblemActionCells;
@end
