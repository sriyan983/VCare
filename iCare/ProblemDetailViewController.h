//
//  ProblemDetailViewController.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemsViewModel.h"

@interface ProblemDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *pTitleLbl;
@property (weak, nonatomic) IBOutlet UITextView *pDescriptionTxtArea;
@property (weak, nonatomic) IBOutlet UILabel *pHasTagLbl;

@property (nonatomic, strong) ProblemsViewModel *viewModel;

- (instancetype)initWithViewModel:(ProblemsViewModel *)viewModel;

@end
