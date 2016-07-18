//
//  FirstViewController.m
//  Task5
//
//  Created by Sergey Plotnikov on 15.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "FirstViewController.h"
#import "UIColor+Hexadecimal.h"
#import <QuartzCore/QuartzCore.h>

@interface FirstViewController ()

@property (weak, nonatomic) CAGradientLayer *redGradient;
@property (weak, nonatomic) CAGradientLayer *greenGradient;
@property (weak, nonatomic) CAGradientLayer *blueGradient;

@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *colorBackgroundButton;

- (IBAction)colorTextEndEditing:(UITextField *)sender;
- (IBAction)backgroundTap:(UIControl *)sender;

@end


@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addLayers];
    [self addKeyboardToolbar];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@(%i)",
                                 self.tabBarController.tabBar.selectedItem.title,
                                 self.navigationController.viewControllers.count];
}

#pragma mark Keyboard's Hidden Methods

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)deregisterFromKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)keyboardWasShown:(NSNotification *)notification {
    
    NSDictionary* info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGPoint buttonOrigin = self.colorTextField.frame.origin;
    CGFloat buttonHeight = self.colorTextField.frame.size.height;
    CGRect visibleRect = self.view.frame;
    visibleRect.size.height -= keyboardSize.height;
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin)) {
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void)addKeyboardToolbar
{
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clearField)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneWithDefaultKeyboard)];
   
    toolbar.items = [NSArray arrayWithObjects:cancel, flexibleSpace, done, nil];
    [toolbar sizeToFit];
    self.colorTextField.inputAccessoryView = toolbar;
}

- (void)keyboardWillBeHidden:(NSNotification *)notification
{
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self deregisterFromKeyboardNotifications];
    [super viewWillDisappear:animated];
}

- (void)doneWithDefaultKeyboard
{
    [self.colorTextField resignFirstResponder];
}

- (void)clearField
{
    self.colorTextField.text = @"";
}

- (IBAction)colorTextEndEditing:(UITextField *)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(UIControl *)sender
{
    [self.colorTextField resignFirstResponder];
}

#pragma mark Background Color

- (IBAction)setBackgroundColor
{
    NSError *error = nil;
    NSString *string = _colorTextField.text;
    UIColor *color = [UIColor colorWithHexString:string error:&error];
    if (!error) {
        self.view.backgroundColor = color;
    } else {
        UIAlertController *alertConrtoller = [UIAlertController alertControllerWithTitle:@"Invalid Enter" message:nil preferredStyle:(UIAlertControllerStyle)UIAlertActionStyleDefault];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault   handler:nil];
        [alertConrtoller addAction:cancelAction];
        [self presentViewController:alertConrtoller animated:YES completion:nil];
    }
}

- (void)addLayers
{
    UIColor *startColor = [UIColor colorWithRed:0 green:_greenColorSlider.value blue:_blueColorSlider.value alpha:1];
    UIColor *endColor = [UIColor colorWithRed:1 green:_greenColorSlider.value blue:_blueColorSlider.value alpha:1];
    
    _redGradient.frame = _redColorSlider.bounds;
    _redGradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    
    [_redGradient setStartPoint:CGPointMake(0.0, 0.5)];
    [_redGradient setEndPoint:CGPointMake(1.0, 0.5)];
    
    [_redColorSlider.layer insertSublayer:_redGradient atIndex:2];
    
    startColor = [UIColor colorWithRed:_redColorSlider.value green:0 blue:_blueColorSlider.value alpha:1];
    endColor = [UIColor colorWithRed:_redColorSlider.value green:1 blue:_blueColorSlider.value alpha:1];
    
    _greenGradient.frame = _greenColorSlider.bounds;
    _greenGradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    
    [_greenGradient setStartPoint:CGPointMake(0.0, 0.5)];
    [_greenGradient setEndPoint:CGPointMake(1.0, 0.5)];
    
    [_greenColorSlider.layer insertSublayer:_greenGradient atIndex:2];
    
    startColor = [UIColor colorWithRed:_redColorSlider.value green:_greenColorSlider.value blue:0 alpha:1];
    endColor = [UIColor colorWithRed:_redColorSlider.value green:_greenColorSlider.value blue:1 alpha:1];
    
    _blueGradient.frame = _blueColorSlider.bounds;
    _blueGradient.colors = [NSArray arrayWithObjects:(id)[startColor CGColor], (id)[endColor CGColor], nil];
    
    [_blueGradient setStartPoint:CGPointMake(0.0, 0.5)];
    [_blueGradient setEndPoint:CGPointMake(1.0, 0.5)];
    
    [_blueColorSlider.layer insertSublayer:_blueGradient atIndex:2];
}

- (IBAction)sliderValue:(UISlider*)sender
{
    [self addLayers];
    UIColor *newColor = [UIColor colorWithRed:_redColorSlider.value green:_greenColorSlider.value blue:_blueColorSlider.value alpha:1];
    self.view.backgroundColor = newColor;
}

@end
