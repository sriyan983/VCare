//
//  FilterProblemViewController.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "FilterProblemViewController.h"
#import "ToggleFilterContentsTableViewController.h"
#import "NSArray+ArrayUtils.h"

@interface FilterProblemViewController ()

@property (nonatomic, weak) ToggleFilterContentsTableViewController *viewController;

@end

@implementation FilterProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Filter";
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(applyFilter)];
    
    self.navigationItem.rightBarButtonItem = doneBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Storyboard delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowFilters_SID"]) {
        _viewController = segue.destinationViewController;
        AddProblemViewModel *viewModelToAssign = [[AddProblemViewModel alloc] initWithCategories:[NSArray mockCategories]
                                                                                           areas:[NSArray mockAreas]];
        [_viewController setViewModel:viewModelToAssign];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return (self.editing == NO);
}

- (void)applyFilter
{
    [self performSegueWithIdentifier:@"BackFromFilterProbToList_SID" sender:self];
}

- (IBAction)toggleFilter:(id)sender {
    NSLog(@"Filter Val parent - %zd", _pFilterSegmentControl.selectedSegmentIndex);
    [_viewController updateSegmentSelectionIndex:_pFilterSegmentControl.selectedSegmentIndex];
}
@end
