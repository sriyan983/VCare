//
//  NSArray+ArrayUtils.m
//  iCare
//
//  Created by Wisdom on 9/24/16.
//  Copyright © 2016 Personal. All rights reserved.
//

#import "NSArray+ArrayUtils.h"

@implementation NSArray (ArrayUtils)

+ (NSArray *)mockCategories
{
    return [NSArray arrayWithObjects:@"Safety/Electricals", @"Hygeine", @"Road Safety", nil];
}

+ (NSArray *)mockAreas
{
    return [NSArray arrayWithObjects:@"Kilpauk", @"Tharamani", @"Velachery", nil];
}

@end
