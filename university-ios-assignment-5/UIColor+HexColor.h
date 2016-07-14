    //
// Created by admin on 14/07/16.
// Copyright (c) 2016 tanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (NSString *)hexStringForColor:(UIColor *)color;

@end