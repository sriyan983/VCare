//
//  PurchasesAndSubscriptionViewController.h
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchasesAndSubscriptionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *cashItemToggleSegmentControl;
- (IBAction)cashItemToggleAction:(id)sender;

@end
