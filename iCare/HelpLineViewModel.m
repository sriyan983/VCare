//
//  HelpLineViewModel.m
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "HelpLineViewModel.h"

@interface HelpLineViewModel ()

@property (nonatomic, strong) NSArray *phoneNumberList;


@end

@implementation HelpLineViewModel

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    _phoneNumberList = [NSArray arrayWithObjects:@"Fire|102", @"Police|100", @"Ambulance|108", @"Electricity Office|0442348893", @"Seewage Departement|0442348891" , nil];
    
    return self;
}

- (NSInteger)numberOfHelpLineNumbers
{
    return [_phoneNumberList count];
}

- (void)setHelpLineNumberToCell:(UITableViewCell *)cell row:(NSInteger)row
{
    cell.textLabel.text = [[[_phoneNumberList objectAtIndex:row] componentsSeparatedByString: @"|"] objectAtIndex:0];
    
    /*cell.imageView.frame = CGRectMake(0.0f, 0.0f, 0.0f, 0.0f);
    cell.imageView.layer.cornerRadius = 8.0;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell*/
     UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(275, 10, 25, 25)];
     imageView.backgroundColor = [UIColor clearColor];
     [imageView.layer setCornerRadius:8.0f];
     [imageView.layer setMasksToBounds:YES];
     [imageView setImage:[UIImage imageNamed:@"1474798371_phone"]];
     [cell.contentView addSubview:imageView];
     
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)makeACall: (NSInteger)row;
{
#if TARGET_IPHONE_SIMULATOR
     UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
     message:@"Use a device with SIM Card"
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles: nil];
     
     [errorAlertView show];
     
#else
    NSString *dialNumber = [[[_phoneNumberList objectAtIndex:row] componentsSeparatedByString: @"|"] objectAtIndex:1];
    
    NSLog(@"Number to dial - %@", dialNumber);
    
    UIApplication *app = [UIApplication sharedApplication];
    NSString *dialThis = [NSString stringWithFormat:@"%@", dialNumber];
    NSURL *url = [NSURL URLWithString:dialThis];
    [app openURL:url];
#endif
}


@end
