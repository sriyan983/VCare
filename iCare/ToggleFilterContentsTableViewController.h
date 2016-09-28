//
//  ToggleFilterContentsTableViewController.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddProblemViewModel.h"

@interface ToggleFilterContentsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) AddProblemViewModel *viewModel;

- (void)updateSegmentSelectionIndex: (NSInteger)index;

@end
