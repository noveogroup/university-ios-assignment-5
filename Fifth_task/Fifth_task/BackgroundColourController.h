//
//  BackgroundColourController.h
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BackgroundColourController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIButton *nextLevelButton;
- (IBAction)nextLevelButtonTap:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
@end

@interface UIColor (Hexidecimal)
+(UIColor*)colorWithHexRGB:(NSString*)colorNumber;
@end

@implementation UIColor (Hexidecimal)

+(UIColor*)colorWithHexRGB:(NSString*)colorNumber{
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    if([colorNumber length] == 6){
        NSScanner *scanner = [NSScanner scannerWithString:colorNumber];
        NSUInteger sum = 0;
        if([scanner scanHexInt:&sum] == YES){
            blue = (float)(sum%256)/256;
            sum /= 256;
            green = (float)(sum%256)/256;
            sum /= 256;
            red = (float)(sum%256)/256;
            return [UIColor colorWithRed:red green:green blue:blue alpha:1];
        }
    }
    return nil;
}

@end
