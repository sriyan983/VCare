//
//  PurchasesAndSubscriptionViewController.m
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "PurchasesAndSubscriptionViewController.h"
#import "PurchasesSubscriptionsTableViewController.h"

@interface PurchasesAndSubscriptionViewController ()

@property (nonatomic, weak) PurchasesSubscriptionsTableViewController *viewController;

@end

@implementation PurchasesAndSubscriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Account";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Storyboard delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"CashItemsToggle_SID"]) {
        _viewController = segue.destinationViewController;
        PurchasesSubscriptionsViewModel *viewModelToAssign = [[PurchasesSubscriptionsViewModel alloc] init];
        [_viewController setViewModel:viewModelToAssign];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return (self.editing == NO);
}

- (IBAction)cashItemToggleAction:(id)sender {
    NSLog(@"Filter Val parent - %zd", _cashItemToggleSegmentControl.selectedSegmentIndex);
    [_viewController updateSegmentSelectionIndex:_cashItemToggleSegmentControl.selectedSegmentIndex];
}
@end
