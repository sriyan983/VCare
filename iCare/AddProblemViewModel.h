//
//  AddProblemViewModel.h
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum FilterTypes
{
    CATEGORY,
    AREA
}FilterType;

@interface AddProblemViewModel : NSObject

- (instancetype)initWithCategories:(NSArray *)categories areas:(NSArray *)areas;
- (NSInteger) numberOfCategories;
- (NSString *) getCategoryAtRow:(NSInteger) row;
- (NSInteger) numberOfAreas;
- (NSString *) getAreaAtRow:(NSInteger) row;

- (NSInteger) numberOfFilterByType:(FilterType)filterType;
- (NSString *) getFilterAtRow:(NSInteger) row filterType:(FilterType)filterType;
- (void) setToggleFilterToCell:(UITableViewCell *)cell row:(NSInteger)row filterType:(FilterType)filterType;
@end
