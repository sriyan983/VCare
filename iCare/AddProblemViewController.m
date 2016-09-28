//
//  AddProblemViewController.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "AddProblemViewController.h"
#import "ProblemsTableViewController.h"
#import "ProblemDetail.h"

@interface AddProblemViewController ()

@end

@implementation AddProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Post";
    
    _pCategoryPickerView.delegate = self;
    _pCategoryPickerView.dataSource = self;
    
    _pTitleTextView.delegate = self;
    _pDescriptionTextView.delegate = self;
    
    [self hideCategoryPickerView];
    
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(submitPost)];
    
    self.navigationItem.rightBarButtonItem = doneBarButton;
    
    self.mapVIew.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    
    self.pHashTagTextField.text = [NSString randomStringWithLength:5];
    
}

-(void)viewDidLayoutSubviews
{
    // The scrollview needs to know the content size for it to work correctly
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                             self.view.frame.size.height + 100.0f
                                             );
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    NSLog(@"%@", [self deviceLocation]);
    
    /*[self.locationManager startUpdatingLocation];*/
    
    self.mapVIew.showsUserLocation = YES;
    [self.mapVIew setMapType:MKMapTypeStandard];
    [self.mapVIew setZoomEnabled:YES];
    [self.mapVIew setScrollEnabled:YES];
    
    [self addUserLocationAnnotation];
    
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapVIew setRegion:region animated:YES];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:YES];
    
    [self.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)uploadPic:(id)sender {
    [self performSegueWithIdentifier:@"AddProblemPic_SID" sender:self];
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue
{
    //NSLog(@"Back to add probs");
}

#pragma mark Storyboard delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddProblemPic_SID"]) {
        
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return (self.editing == NO);
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *) fromViewController withSender:(id)sender
{
    return YES;
}


#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [_viewModel numberOfCategories];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [_viewModel getCategoryAtRow:row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    [self hideCategoryPickerView];
    
    NSString *selectedCategory =  [_viewModel getCategoryAtRow:row];
    _pCategoryTextField.text = selectedCategory;
    
    NSLog(@"Category - %@", selectedCategory);
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView
             attributedTitleForRow:(NSInteger)row
                      forComponent:(NSInteger)component
{
    NSString *selectedCategory =  [_viewModel getCategoryAtRow:row];
    return [[NSAttributedString alloc] initWithString:selectedCategory
                                           attributes:@
            {
            NSForegroundColorAttributeName:[UIColor whiteColor]
            }];
}

#pragma mark Texfield delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _pCategoryTextField) {
        [textField resignFirstResponder];
        
        [self showCategoryPickerView];
    }
}

#pragma mark Textview delegates
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void) textViewDidBeginEditing:(UITextView *) textView {
    textView.text = @"";
}

- (void)showCategoryPickerView
{
    [_mapVIew setHidden:YES];
    [_pCategoryPickerView setHidden:NO];
}

- (void)hideCategoryPickerView
{
    [_mapVIew setHidden:NO];
    [_pCategoryPickerView setHidden:YES];
}

- (BOOL)checkIfProblemDetilaExists
{
    NSArray *list = self.problemsTableViewController.problemsList;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pID MATCHES %@", @"3"];
    NSArray *filteredArray = [list filteredArrayUsingPredicate:predicate];
    if ([filteredArray count] > 0)
        return YES;
    else
        return NO;
}

- (void)submitPost
{
    NSLog(@"Submit tapped...");
    
    if (![self checkIfProblemDetilaExists])
    {
        ProblemDetail *detail = [[ProblemDetail alloc] initWithProblemTitle:_pTitleTextView.text description:_pDescriptionTextView.text category:_pCategoryTextField.text location:@"12.9814|80.2432" ID:@"3" votes:@"2" hashTag:[NSString randomStringWithLength:5]];
        [self.problemsTableViewController addProblem:detail];
        NSLog(@"current count - %zd", [self.problemsTableViewController.problemsList count]);
        
    }
    [self performSegueWithIdentifier:@"BackFromAddToProbList_SID" sender:self];
}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}

- (void) addUserLocationAnnotation
{
    //<wpt lat="12.9814" lon="80.2432">
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
    myAnnotation.coordinate = CLLocationCoordinate2DMake(12.9814, 80.2432);
    myAnnotation.title = @"Tharamani";
    myAnnotation.subtitle = @"Hub";
    [self.mapVIew addAnnotation:myAnnotation];
}

#pragma mark Delegate Methods

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        NSLog(@"Clicked annotation");
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Feature coming soon" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            //pinView.image = [UIImage imageNamed:@"pin.png"];
            pinView.calloutOffset = CGPointMake(0, 32);
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
            pinView.rightCalloutAccessoryView = rightButton;
            
            // Add an image to the left callout.
            //UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin.png"]];
            //pinView.leftCalloutAccessoryView = iconView;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}



@end
