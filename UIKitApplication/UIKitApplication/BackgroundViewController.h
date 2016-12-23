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

// Get UIColor from NSString
+ (UIColor *)colorWithStringRGB:(NSString *)rgb;

@end	