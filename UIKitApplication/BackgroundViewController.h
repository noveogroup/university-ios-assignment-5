//
//  BackgroundViewController.h
//  UIKitApplication
//
//  Created by Иван Букшев on 3/4/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundViewController : UIViewController <UITextFieldDelegate>

// Sliders for changing background color.
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

// TextFields for changing background color.
@property (weak, nonatomic) IBOutlet UITextField *redTextField;
@property (weak, nonatomic) IBOutlet UITextField *greenTextField;
@property (weak, nonatomic) IBOutlet UITextField *blueTextField;
@property (weak, nonatomic) IBOutlet UITextField *rgbTextField;

// Button to go to the next level. 
@property (weak, nonatomic) IBOutlet UIButton *nextLevelButton;

// Listeners to the elements.
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)nextLevelButtonTap:(id)sender;
- (IBAction)textFieldValueChanged:(id)sender;

// Small hack to dismiss keyboard after editing text in textField.
- (IBAction)dismissKeyboard:(id)sender;

@end


@interface UIColor (Hexidecimal)

// PROBLEM WITH THIS METHOD
+ (UIColor *)colorWithStringRGB:(NSString *)rgb;

@end


@implementation UIColor (Hexidecimal)

// PROBLEM WITH THIS METHOD
+ (UIColor *)colorWithHexRGB:(NSString *)rgb
{
    CGFloat red = 0.f, green = 0.f, blue = 0.f;
    
    if ([rgb length] == 6)
    {
        NSUInteger summ = 0;
        NSScanner *scanner = [NSScanner scannerWithString:rgb];
        
        if ([scanner scanHexInt:&summ] == YES)
        {
            blue = (float)((summ % 256) / 256);
            summ /= 256;
            
            green = (float)((summ % 256) / 256);
            summ /= 256;
            
            red = (float)((summ % 256) / 256);
            
            return [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
        }
    }
    
    return nil;
}

@end