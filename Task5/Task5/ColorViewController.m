//
//  ColorViewController.m
//  Task5
//
//  Created by Sergey Plotnikov on 14.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "ColorViewController.h"
#import <iOS-Color-Picker/FCColorPickerViewController.h>

@interface ColorViewController () <FCColorPickerViewControllerDelegate>

@property (nonatomic, copy) UIColor *color;

@end

@implementation ColorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)pickColor:(id)sender
{
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPickerWithColor:self.color
                                                                                        delegate:self];
    colorPicker.tintColor = [UIColor whiteColor];
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker
                       animated:YES
                     completion:nil];
}

- (void)colorPickerViewController:(FCColorPickerViewController *)colorPicker
                   didSelectColor:(UIColor *)color
{
    self.color = color;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setColor:(UIColor *)color
{
    _color = [color copy];
    [self.view setBackgroundColor:_color];
}

@end
