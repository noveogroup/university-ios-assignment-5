//
// Created by admin on 14/07/16.
// Copyright (c) 2016 tanya. All rights reserved.
//

#import "UIColor+HexColor.h"
NSString *hexSymbols = @"0123456789ABCDEFabcdef";
NSInteger characterCount = 6;


@implementation UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    if ([stringToConvert containsString:@"#"]) {
        stringToConvert= [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""]; // remove the #
    }
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]]; // remove + and $

    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

+ (NSString *)hexStringForColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

+ (BOOL)validHEXString:(NSString *)string
{
    NSUInteger newLength = string.length;
    NSCharacterSet *set = [[NSCharacterSet characterSetWithCharactersInString:hexSymbols] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
    return (([string isEqualToString:filtered]) && (newLength <= characterCount));
}

@end