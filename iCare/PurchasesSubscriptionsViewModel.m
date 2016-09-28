//
//  PurchasesSubscriptionsViewModel.m
//  iCare
//
//  Created by Wisdom on 9/25/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "PurchasesSubscriptionsViewModel.h"

@interface PurchasesSubscriptionsViewModel ()

@property (nonatomic, strong) NSArray *purchaseHistoryList;
@property (nonatomic, strong) NSArray *subscriptionHistoryList;

@end

@implementation PurchasesSubscriptionsViewModel

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    _purchaseHistoryList = [NSArray arrayWithObjects:@"#VCARETHARMANI001", @"#VCARETHARMANI002", @"#VCARETHARMANI003", nil];
    
     _subscriptionHistoryList = [NSArray arrayWithObjects:@"#VCARETHARMANI001", @"#VCARETHARMANI002", nil];
    
    return self;
}

- (void) setCashItemToCell: (UITableViewCell *)cell row:(NSInteger)row cashItemType:(CashItemType)type
{
    if (type == PURCHASE)
        cell.textLabel.text = [_purchaseHistoryList objectAtIndex:row];
    else
        cell.textLabel.text = [_subscriptionHistoryList objectAtIndex:row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (NSInteger) numberOfCashItemsByType:(CashItemType)filterType
{
    if (filterType == SUBSCRIPTION)
    {
        return [_subscriptionHistoryList count];
    }
    else
    {
        return [_purchaseHistoryList count];
    }
}

- (NSString *) getCashItemsAtRow:(NSInteger) row filterType:(CashItemType)filterType;
{
    if (filterType == SUBSCRIPTION)
    {
        return [_subscriptionHistoryList objectAtIndex:row];
    }
    else
    {
        return [_purchaseHistoryList objectAtIndex:row];
    }
}

@end
