//
//  ViewController.m
//  iCare
//
//  Created by Wisdom on 9/23/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@property (nonatomic, strong, readonly) SignInViewModel *viewModel;

@end

@implementation SignInViewController

/* - (instancetype)initWithViewModel:(SignInViewModel *)viewModel {
    self = [super init];
    if (!self) return nil;
    
    _viewModel = viewModel;
    
    return self;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Log In";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Texfield delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)loginButtonTapped:(id)sender {
    
    //If there was remember me this VC would have been init with initWithViewModel
    SignInInfo *info = [[SignInInfo alloc] initWithEmail:@"sriyan983@gmail.com" password:@"test134"];
    _viewModel = [[SignInViewModel alloc] initWithStore:info];
    
    [_viewModel validateUser];
    
    [self performSegueWithIdentifier:@"SignIn_SID" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SignIn_SID"]) {
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return (self.editing == NO);
}

@end
