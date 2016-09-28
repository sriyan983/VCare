//
//  ToggleFilterContentsTableViewController.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ToggleFilterContentsTableViewController.h"
#import "FilterProblemViewController.h"

@interface ToggleFilterContentsTableViewController ()

@property (nonatomic, weak) FilterProblemViewController *filterProblemViewController;
@property (nonatomic, strong) NSMutableArray *cellsSelected;
@property (nonatomic) NSInteger selectedSegmentIndex;

@end

@implementation ToggleFilterContentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cellsSelected = [NSMutableArray array];

    // Do any additional setup after loading the view, typically from a nib.
     _filterProblemViewController = (FilterProblemViewController *)self.presentingViewController;
}

#pragma mark Table view delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel numberOfFilterByType:(_selectedSegmentIndex == 0 ? CATEGORY : AREA)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //ToggleFilterCell
    static NSString *CellIdentifier = @"ToggleFilterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
   
    [_viewModel setToggleFilterToCell:cell row:indexPath.row filterType:(_selectedSegmentIndex == 0 ? CATEGORY : AREA)];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([_cellsSelected containsObject:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_cellsSelected containsObject:indexPath])
    {
        [_cellsSelected removeObject:indexPath];
    }
    else
    {
        [_cellsSelected addObject:indexPath];
    }
    [tableView reloadData];
}

#pragma mark user defined methods

- (void)updateSegmentSelectionIndex: (NSInteger)index
{
    _selectedSegmentIndex = index;
    
    [self.tableView reloadData];
}

@end
