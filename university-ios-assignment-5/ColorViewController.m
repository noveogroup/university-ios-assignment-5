//
// Created by admin on 13/07/16.
// Copyright (c) 2016 tanya. All rights reserved.
//

#import "ColorViewController.h"
#import "UIColor+HexColor.h"

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
    self.navigationItem.title = [NSString stringWithFormat:@"%@: (%lu)", self.navigationController.tabBarItem.title, self.navigationController.viewControllers.count];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.colorTextField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newString = [self.colorTextField.text stringByReplacingCharactersInRange:range withString:string];
    return [UIColor validHEXString:newString];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self changeColorBySliders];
}

- (IBAction)colorTextFieldValuechanged:(id)sender {
    UIColor *color =[UIColor colorWithHexString:self.colorTextField.text];
    self.view.backgroundColor = color;
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    self.rColorSlider.value = components[0];
    self.gColorSlider.value = components[1];
    self.bColorSlider.value = components[2];
}

- (IBAction)changeColorBySliders
{
    UIColor *color = [UIColor colorWithRed:self.rColorSlider.value green:self.gColorSlider.value blue:self.bColorSlider.value alpha:1];
    self.view.backgroundColor = color;
    self.colorTextField.text = [UIColor hexStringForColor:color];
}

@end