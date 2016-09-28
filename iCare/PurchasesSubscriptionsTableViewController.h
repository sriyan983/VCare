//
//  PurchasesSubscriptionsTableViewController.h
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchasesSubscriptionsViewModel.h"

@interface PurchasesSubscriptionsTableViewController : UITableViewController

@property (nonatomic, strong) PurchasesSubscriptionsViewModel *viewModel;

- (void)updateSegmentSelectionIndex: (NSInteger)index;

@end
