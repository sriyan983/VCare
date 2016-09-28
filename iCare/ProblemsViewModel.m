//
//  ProblemsViewModel.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemsViewModel.h"

typedef enum ProblemActions {
    MAP,
    VOTE,
    PICS,
    COMMENT,
    CLOSE
}ProblemAction;

@interface ProblemsViewModel ()


@end

@implementation ProblemsViewModel

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    return self;
}

- (instancetype)initWithStore:(ProblemDetail *) problemDetail {
    self = [super init];
    if (!self) return nil;
    
    _problemDetail = problemDetail;
    
    return self;
}

- (void) setProblemDetailToCell: (ProblemTableViewCell *)cell problemVotingDelegate:(id<ProblemVotingDelegate>) problemVotingDelegate
{
    cell.problemTitleLbl.text = _problemDetail.pTitle;
    cell.problemDescriptionLbl.text = _problemDetail.pDescription;

    cell.voteNumbersLbl.text = [NSString stringWithFormat:@"(%@)", _problemDetail.pVotes];
    cell.problemHashTagLbl.text = _problemDetail.pHashTag;
    cell.tag = [_problemDetail.pID integerValue];
    
    [cell setProblemVoteDelegate:problemVotingDelegate];
}

- (void) setProblemTitle:(UILabel *)pTitleLabel titleDescription:(UITextView *)pTitleDescriptionTextView hashTag:(UILabel *)pHashTagLabel;
{
    pTitleLabel.text =_problemDetail.pTitle;
    pTitleDescriptionTextView.text = _problemDetail.pDescription;
    pHashTagLabel.text = _problemDetail.pHashTag;
}

- (void) setProblemActionToCell: (UITableViewCell *)cell row:(NSInteger)row
{
    switch (row) {
        case MAP:
            cell.textLabel.text = @"Map";
            break;
        case VOTE:
            cell.textLabel.text = [NSString stringWithFormat:@"Votes (%@)", _problemDetail.pVotes];
            break;
        case PICS:
            cell.textLabel.text = @"Pics";
            break;
        case COMMENT:
            cell.textLabel.text = @"Comment";
            break;
        case CLOSE:
            cell.textLabel.text = @"Purchase Content (Press Only)";
            break;
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (NSInteger) numberOfProblemActionCells
{
    return 5;
}


@end
