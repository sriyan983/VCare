//
//  HelpLineTableViewController.m
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "HelpLineTableViewController.h"
#import "HelpLineViewModel.h"
@interface HelpLineTableViewController ()

@property (nonatomic, strong) HelpLineViewModel *viewModel;

@end

@implementation HelpLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Help Line";
    
    _viewModel = [[HelpLineViewModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfHelpLineNumbers];
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HelpLineCell" forIndexPath:indexPath];
     [_viewModel setHelpLineNumberToCell:cell row:indexPath.row];
     return cell;
 }
 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel makeACall:indexPath.row];
}

@end
