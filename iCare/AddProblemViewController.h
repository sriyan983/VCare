//
//  AddProblemViewController.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "AddProblemViewModel.h"
#import "ProblemsTableViewController.h"
#import "NSString+Utils.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface AddProblemViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate, MKMapViewDelegate,  CLLocationManagerDelegate>

@property(nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, strong) AddProblemViewModel *viewModel;
@property (nonatomic, weak) ProblemsTableViewController *problemsTableViewController;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *pCategoryTextField;
@property (weak, nonatomic) IBOutlet MKMapView *mapVIew;
@property (weak, nonatomic) IBOutlet UITextField *pHashTagTextField;
@property (weak, nonatomic) IBOutlet UIButton *pUploadPics;
@property (weak, nonatomic) IBOutlet UISwitch *pAllowSocialPostSwitch;
@property (weak, nonatomic) IBOutlet UIPickerView *pCategoryPickerView;
@property (weak, nonatomic) IBOutlet UITextView *pTitleTextView;
@property (weak, nonatomic) IBOutlet UITextView *pDescriptionTextView;

- (IBAction)uploadPic:(id)sender;
- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue;
@end
