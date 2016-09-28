//
//  FilterProblemViewController.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddProblemViewModel.h"

@interface FilterProblemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *pFilterSegmentControl;
- (IBAction)toggleFilter:(id)sender;

@end
