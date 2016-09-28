//
//  ProblemsTableViewController.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "ProblemsTableViewController.h"
#import "ProblemTableViewCell.h"
#import "ProblemsViewModel.h"
#import "ProblemDetailViewController.h"
#import "AddProblemViewController.h"
#import "NSArray+ArrayUtils.h"

@interface ProblemsTableViewController()

@property (nonatomic, strong, readonly) ProblemsViewModel *viewModel;

@end

@implementation ProblemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Problems";
    
    _viewModel = [[ProblemsViewModel alloc] init];
    _problemsList = [[NSMutableArray alloc] init];
    
    [self mockProblemData];
    
    UIBarButtonItem *addProblem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProblem)];

    UIBarButtonItem *filterButton = [[UIBarButtonItem alloc]initWithTitle:@"Filter"
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(filterButton)];
    self.navigationItem.rightBarButtonItems = @[addProblem, filterButton];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    NSLog(@"List count - %zd", [_problemsList count]);
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
    
}

- (IBAction)prepareForUnwindFromAddProblem:(UIStoryboardSegue *)segue
{
    
}

#pragma mark Table view delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.problemsList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 150.0f;
}

/*-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50.0f;
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProblemTableViewCell";
    ProblemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (_viewModel.problemDetail != NULL || _viewModel.problemDetail != nil)
        _viewModel.problemDetail = nil;
    
    [_viewModel setProblemDetail:[self.problemsList objectAtIndex:indexPath.row]];
    [_viewModel setProblemDetailToCell:cell problemVotingDelegate:self];
    
    tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    [tableView setSeparatorColor:[UIColor darkGrayColor]];
    
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine; // or you have the //previous 'None' style...
    //self.tableView.separatorColor = [UIColor blueColor];
    
    return cell; 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_viewModel.problemDetail != NULL || _viewModel.problemDetail != nil)
        _viewModel.problemDetail = nil;
    
    [_viewModel setProblemDetail:[self.problemsList objectAtIndex:indexPath.row]];
    [self performSegueWithIdentifier:@"ProblemDetails_SID" sender:self];

}

#pragma mark Storyboard delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ProblemDetails_SID"]) {
        
        ProblemDetailViewController *viewController = segue.destinationViewController;
        ProblemsViewModel *viewModelToAssign = [[ProblemsViewModel alloc] initWithStore:_viewModel.problemDetail];
        [viewController setViewModel:viewModelToAssign];
    }
    else if ([[segue identifier] isEqualToString:@"AddProblem_SID"])
    {
        AddProblemViewController *viewController = segue.destinationViewController;
        AddProblemViewModel *viewModelToAssign = [[AddProblemViewModel alloc] initWithCategories:[NSArray mockCategories]
                                                                                           areas:[NSArray mockAreas]];
        [viewController setViewModel:viewModelToAssign];
        [viewController setProblemsTableViewController:self];
    }
    else if ([[segue identifier] isEqualToString:@"FilterProblems_SID"])
    {
        
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return (self.editing == NO);
}

- (void) mockProblemData
{
    ProblemDetail *problem = [[ProblemDetail alloc] initWithProblemTitle:@"Harmful ride to office" description:@"There is not way to side off but yet there is no space to ride on this broken road in vadapalani as well." category:@"Safety" location:@"75.098|80.098" ID:@"0" votes:@"2" hashTag:[NSString randomStringWithLength:5]];
    [_problemsList addObject:problem];
    
     problem = [[ProblemDetail alloc] initWithProblemTitle:@"Unhygienic rest rooms - a pain" description:@"Dgl bustand never keeps its toilets clean. We are at a risk to catch up infections" category:@"Hygeine" location:@"75.098|80.098" ID:@"202" votes:@"1" hashTag:[NSString randomStringWithLength:5]];
    [_problemsList addObject:problem];
    
    problem = [[ProblemDetail alloc] initWithProblemTitle:@"No light on residential street" description:@"There are no lights on 25, Harword street and there are many pick pokets happening because of this. Last week had my chain and money robbed! " category:@"Electric/Safety" location:@"75.098|80.098" ID:@"2" votes:@"2" hashTag:[NSString randomStringWithLength:5]];
    [_problemsList addObject:problem];
}

- (void) addProblem:(ProblemDetail *)problem
{
    [_problemsList addObject:problem];
}

#pragma mark User defined methods
- (void)addProblem
{
    [self performSegueWithIdentifier:@"AddProblem_SID" sender:self];
}

- (void)filterButton
{
    [self performSegueWithIdentifier:@"FilterProblems_SID" sender:self];

}

#pragma mark voteForProblem delegate
- (void)voteForProblem:(int)problemID
{
    NSLog(@"problem vote received - %@", [[_problemsList objectAtIndex:problemID] pHashTag]);
    
    ProblemDetail *detail = [_problemsList objectAtIndex:problemID];
    NSInteger votes = [detail.pVotes integerValue] + 1;
    detail.pVotes = [NSString stringWithFormat:@"%zd", votes];
    
    NSLog(@"vote update number - %@", [[_problemsList objectAtIndex:problemID] pVotes]);
    
    [self.tableView reloadData];
}

@end
