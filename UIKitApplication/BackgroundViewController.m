//
//  BackgroundViewController.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/4/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "BackgroundViewController.h"

@interface BackgroundViewController ()

@end

@implementation BackgroundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        //[self.redTextField setText:153];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set start background color.
    self.view.backgroundColor = [UIColor colorWithRed:153.f/255.f
                                                green:102.f/255.f
                                                 blue:255.f/255.f
                                                alpha:1.f];
    
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
        self.navigationItem.title = [NSString stringWithFormat:@"%@: %d", self.navigationController.title, index];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
    self.view.backgroundColor = [UIColor colorWithStringRGB:self.rgbTextField.text];
    
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

- (IBAction)dismissKeyboard:(id)sender
{
    [self.redTextField resignFirstResponder];
    [self.greenTextField resignFirstResponder];
    [self.blueTextField resignFirstResponder];
}

@end
