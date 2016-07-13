//
// Created by admin on 13/07/16.
// Copyright (c) 2016 tanya. All rights reserved.
//

#import "ColorViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ColorViewController ()

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
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithRed:self.rColorSlider.value green:self.gColorSlider.value blue:self.bColorSlider.value alpha:1];
}
- (IBAction)rColorValueChanged:(id)sender
{
    
    self.view.backgroundColor = [UIColor colorWithRed:self.rColorSlider.value green:self.gColorSlider.value blue:self.bColorSlider.value alpha:1];
}
- (IBAction)gColorValueChanged:(id)sender
{
    
    self.view.backgroundColor = [UIColor colorWithRed:self.rColorSlider.value green:self.gColorSlider.value blue:self.bColorSlider.value alpha:1];
}
- (IBAction)bColorValueChanged:(id)sender
{
    
    self.view.backgroundColor = [UIColor colorWithRed:self.rColorSlider.value green:self.gColorSlider.value blue:self.bColorSlider.value alpha:1];
}
- (IBAction)colorTextFieldValuechanged:(id)sender {

}

@end