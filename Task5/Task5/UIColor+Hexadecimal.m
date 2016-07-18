//
//  UIColor.m
//  Task5
//
//  Created by Sergey Plotnikov on 18.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "UIColor+Hexadecimal.h"

@implementation UIColor (Hexadecimal)

+ (UIColor *)colorWithHexString:(NSString *)hexString error:(NSError *__autoreleasing *)error
{
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:@"^#(?:[0-9a-fA-F]{3}){1,2}$"
        options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:hexString
        options:0 range:NSMakeRange(0, [hexString length])];
    
    if ((numberOfMatches == 1) && (![hexString isEqualToString:@""])) {
        unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:hexString];
        [scanner setScanLocation:1];
        [scanner scanHexInt:&rgbValue];
        return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    }
    
    else {
        *error = [NSError errorWithDomain:@"UIColor+Hexadecimal.h" code:1 userInfo:nil];
        return nil;
    }
}

@end