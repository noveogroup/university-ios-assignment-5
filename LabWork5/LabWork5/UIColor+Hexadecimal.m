//
//  UIColor+Hexadecimal.m
//  LabWork5
//
//  Created by Александр on 10.03.15.
//  Copyright (c) 2015 Alexandr Ovchinnikov. All rights reserved.
//

#import "UIColor+Hexadecimal.h"

@implementation UIColor (Hexadecimal)

- (NSString *)hexColorString
{
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

@end
