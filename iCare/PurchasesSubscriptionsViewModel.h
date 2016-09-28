//
//  PurchasesSubscriptionsViewModel.h
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum CashItemTypes
{
    PURCHASE,
    SUBSCRIPTION
    
}CashItemType;

@interface PurchasesSubscriptionsViewModel : NSObject

- (void) setCashItemToCell: (UITableViewCell *)cell row:(NSInteger)row cashItemType:(CashItemType)type;
- (NSInteger) numberOfCashItemsByType:(CashItemType)filterType;
- (NSString *) getCashItemsAtRow:(NSInteger) row filterType:(CashItemType)filterType;
@end
