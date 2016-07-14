//
// Created by admin on 13/07/16.
// Copyright (c) 2016 tanya. All rights reserved.
//

#import "ColorViewController.h"
#import "UIColor+HexColor.h"

NSString *hexSymbols = @"0123456789ABCDEFabcdef";
NSInteger characterCount = 6;

@interface ColorViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISlider *rColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *gColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *bColorSlider;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end


@implementation ColorViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.colorTextField.delegate = self;
    [self.colorTextField addTarget:self action:@selector(colorTextFieldValuechanged:) forControlEvents:UIControlEventEditingChanged];
    [self.rColorSlider addTarget:self action:@selector(changeColorBySliders) forControlEvents:UIControlEventValueChanged];
    [self.gColorSlider addTarget:self action:@selector(changeColorBySliders) forControlEvents:UIControlEventValueChanged];
    [self.bColorSlider addTarget:self action:@selector(changeColorBySliders) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.title = [NSString stringWithFormat:@"%@: (%lu)", self.navigationController.tabBarItem.title, self.navigationController.viewControllers.count];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.colorTextField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSUInteger newLength = self.colorTextField.text.length + string.length - range.length;
    NSCharacterSet *set = [[NSCharacterSet characterSetWithCharactersInString:hexSymbols] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
    return (([string isEqualToString:filtered]) && (newLength <= characterCount));
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self changeColorBySliders];
}

- (IBAction)colorTextFieldValuechanged:(id)sender {
    if (self.colorTextField.text.length == characterCount) {
        UIColor *color =[UIColor colorWithHexString:self.colorTextField.text];
        self.view.backgroundColor = color;
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        self.rColorSlider.value = components[0];
        self.gColorSlider.value = components[1];
        self.bColorSlider.value = components[2];
    }
}

- (void)changeColorBySliders
{
    UIColor *color = [UIColor colorWithRed:self.rColorSlider.value green:self.gColorSlider.value blue:self.bColorSlider.value alpha:1];
    self.view.backgroundColor = color;
    self.colorTextField.text = [UIColor hexStringForColor:color];
}

@end