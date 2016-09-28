//
//  ProblemDetailViewController.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemDetailViewController.h"
#import "ProblemActionsTableViewController.h"

@interface ProblemDetailViewController ()

@end

@implementation ProblemDetailViewController

- (instancetype)initWithViewModel:(ProblemsViewModel *)viewModel
{
    self = [super init];
    if (!self) return nil;
    
    _viewModel = viewModel;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Problem";
    
    [_viewModel setProblemTitle:_pTitleLbl titleDescription:_pDescriptionTxtArea hashTag:_pHasTagLbl];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Storyboard delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ProblemActions_SID"]) {
        ProblemActionsTableViewController *viewController = segue.destinationViewController;
        ProblemsViewModel *viewModelToAssign = [[ProblemsViewModel alloc] initWithStore:_viewModel.problemDetail];
        [viewController setViewModel:viewModelToAssign];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return (self.editing == NO);
}
//
@end
