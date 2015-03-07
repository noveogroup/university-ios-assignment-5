//
//  BackgroundViewController.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/4/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "BackgroundViewController.h"
#import "UIColor+Extensions.h"

@interface BackgroundViewController ()

@end

@implementation BackgroundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set start background color.
    self.view.backgroundColor = [UIColor safestVioletColor];
                        
    // Set keyboard type to numberpad for each text field.
    [self.redTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.greenTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.blueTextField setKeyboardType:UIKeyboardTypeNumberPad];
    
    // Set start backgroung color.
    [self.redTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * self.redSlider.value)]];
    [self.greenTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * self.greenSlider.value)]];
    [self.blueTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * self.blueSlider.value)]];
    
    if (self.navigationController)
    {
        // Get level of nesting and set it to label.
        NSUInteger index = [self.navigationController.viewControllers indexOfObject:self];
        
        // THIS METHOD CAN WORK UNCORRECTLY!
        self.navigationItem.title = [NSString stringWithFormat:@"%@: %d", self.navigationController.title, index];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
    // Get UIColor from NSString and set new BG color.
    UIColor *newBGColor = [UIColor colorWithStringRGB:self.rgbTextField.text];
    self.view.backgroundColor = newBGColor;
    
    // Get color components values.
    CGFloat red = 0.f, green = 0.f, blue = 0.f, alpha = 0.f;
    [newBGColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    // Set values from rgbTextField to components textFields.
    [self.redTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * red)]];
    [self.greenTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * green)]];
    [self.blueTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * blue)]];
    
    // Set values from textFields to sliders.
    self.redSlider.value = [[self.redTextField text] floatValue] / 255.f;
    self.greenSlider.value = [[self.greenTextField text] floatValue] / 255.f;
    self.blueSlider.value = [[self.blueTextField text] floatValue] / 255.f;
    
    [sender resignFirstResponder];
    return YES;
}

- (IBAction)sliderValueChanged:(id)sender
{
    // Set the background based on the values of sliders. 
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
                                                green:self.greenSlider.value
                                                 blue:self.blueSlider.value
                                                alpha:1.f];
    
    // Set values from sliders to textFields.
    [self.redTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * self.redSlider.value)]];
    [self.greenTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * self.greenSlider.value)]];
    [self.blueTextField setText:[NSString stringWithFormat:@"%.0f", (255.f * self.blueSlider.value)]];
}

- (IBAction)nextLevelButtonTap:(id)sender
{
    // Dismiss a keyboard and go to new level.
    [self dismissKeyboard:sender];
    if (self.navigationController)
    {
        BackgroundViewController *backgroundVC = [[BackgroundViewController alloc] init];
        [self.navigationController pushViewController:backgroundVC animated:YES];
    }
}

- (IBAction)textFieldValueChanged:(id)sender
{
    // Set the background based on the values of textFields.
    self.view.backgroundColor = [UIColor colorWithRed:[[self.redTextField text] floatValue]/255.f
                                                green:[[self.greenTextField text] floatValue]/255.f
                                                 blue: [[self.blueTextField text] floatValue]/255.f
                                                alpha:1.f];
    
    // Set values from textFields to sliders.
    self.redSlider.value = [[self.redTextField text] floatValue] / 255.f;
    self.greenSlider.value = [[self.greenTextField text] floatValue] / 255.f;
    self.blueSlider.value = [[self.blueTextField text] floatValue] / 255.f;
}

// Dismiss a keyboard.
- (IBAction)dismissKeyboard:(id)sender
{
    [self.redTextField resignFirstResponder];
    [self.greenTextField resignFirstResponder];
    [self.blueTextField resignFirstResponder];
    [self.rgbTextField resignFirstResponder];
}

@end


@implementation UIColor (Hexidecimal)

// Get UIColor From NSString
+ (UIColor *)colorWithStringRGB:(NSString *)rgb
{
    CGFloat red = 0.f, green = 0.f, blue = 0.f;
    
    if ([rgb length] == 6)
    {
        NSUInteger baseColor = 0;
        NSScanner *scanner = [NSScanner scannerWithString:rgb];
        
        if ([scanner scanHexInt:&baseColor] == YES)
        {
            red = (CGFloat)((baseColor & 0xFF0000) >> 16) / 255.0f;
            green = (CGFloat)((baseColor & 0x00FF00) >> 8) / 255.0f;
            blue = (CGFloat)(baseColor & 0x0000FF) / 255.0f;
            
            return [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
        }
    }
    
    return nil;
}

@end