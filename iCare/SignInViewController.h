//
//  ViewController.h
//  iCare
//
//  Created by Wisdom on 9/23/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInViewModel.h"

@interface SignInViewController : UIViewController <UITextFieldDelegate>

//- (instancetype)initWithViewModel:(SignInViewModel *)viewModel;

- (IBAction)loginButtonTapped:(id)sender;

@end

