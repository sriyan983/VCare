//
//  ProblemsTableViewController.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemDetail.h"
#import "NSString+Utils.h"
#import "ProblemVotingDelegate.h"
//Above import violated MVVM

@interface ProblemsTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate, ProblemVotingDelegate>

@property (nonatomic, strong) NSMutableArray *problemsList;

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue;
- (IBAction)prepareForUnwindFromAddProblem:(UIStoryboardSegue *)segue;
//violating MVVM here
- (void) addProblem:(ProblemDetail *)problem;

@end
