//
//  UIColor+Extensions.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/7/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "UIColor+Extensions.h"

@implementation UIColor (Extensions)

+ (UIColor *) safestVioletColor
{
    return [UIColor colorWithRed:153.f/255.f
                           green:102.f/255.f
                            blue:255.f/255.f
                           alpha:1.f];
}

+ (UIColor *) safestIndigoColor
{
    return [UIColor colorWithRed:75.f/255.f
                           green:0.f/255.f
                            blue:130.f/255.f
                           alpha:1.f];
}

@end
