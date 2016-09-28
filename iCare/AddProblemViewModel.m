//
//  AddProblemViewModel.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "AddProblemViewModel.h"

@interface AddProblemViewModel ()

@property (nonatomic, strong, readonly) NSArray *categories;
@property (nonatomic, strong, readonly) NSArray *areas;

@end

@implementation AddProblemViewModel

- (instancetype)initWithCategories:(NSArray *)categories areas:(NSArray *)areas
{
    self = [super init];
    if (!self) return nil;
    
    _categories = categories;
    _areas = areas;
    
    return self;
}

- (NSInteger) numberOfCategories
{
    if (_categories != NULL || _categories != nil)
        return [_categories count];
    else
        return 0;
}

- (NSString *) getCategoryAtRow:(NSInteger) row
{
    if (_categories != NULL || _categories != nil)
        return [_categories objectAtIndex:row];
    else
        return @"";
}

- (NSInteger) numberOfAreas
{
    if (_areas != NULL || _areas != nil)
        return [_areas count];
    else
        return 0;
}

- (NSString *) getAreaAtRow:(NSInteger) row
{
    if (_areas != NULL || _areas != nil)
        return [_areas objectAtIndex:row];
    else
        return @"";
}

- (NSInteger) numberOfFilterByType:(FilterType)filterType
{
    if (filterType == CATEGORY)
    {
        return [self numberOfCategories];
    }
    else
    {
        return [self numberOfAreas];
    }
}

- (NSString *) getFilterAtRow:(NSInteger) row filterType:(FilterType)filterType
{
    if (filterType == AREA)
    {
        return [self getAreaAtRow:row];
    }
    else
    {
        return [self getCategoryAtRow:row];
    }
}

- (void) setToggleFilterToCell:(UITableViewCell *)cell row:(NSInteger)row filterType:(FilterType)filterType
{
    if (filterType == AREA)
    {
        cell.textLabel.text =[self getAreaAtRow:row];
    }
    else
    {
        cell.textLabel.text =[self getCategoryAtRow:row];
    }
}


@end
