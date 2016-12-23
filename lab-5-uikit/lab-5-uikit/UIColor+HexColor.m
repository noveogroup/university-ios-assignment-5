//
//  UIColor+HexColor.m
//  lab-5-uikit
//
//  Created by Admin on 30/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)string {
    float channelValues[3];

    for (int i = 0; i < 3; i++) {
        unsigned int channelValue = 0;
        NSString *channelString = [string substringWithRange:NSMakeRange(i*2, 2)];
        
        NSScanner *scanner = [NSScanner scannerWithString:channelString];

        [scanner scanHexInt:&(channelValue)];
        
        channelValues[i] = channelValue / 255.0;
    }
    
    return [UIColor
        colorWithRed:channelValues[0]
        green:channelValues[1]
        blue:channelValues[2]
        alpha:1
    ];
};

@end
