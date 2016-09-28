//
//  HelpLineViewModel.h
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HelpLineViewModel : NSObject

- (instancetype)init;
- (NSInteger)numberOfHelpLineNumbers;
- (void)setHelpLineNumberToCell:(UITableViewCell *)cell row:(NSInteger)row;
- (void)makeACall: (NSInteger)row;
@end
