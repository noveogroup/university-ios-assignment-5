//
//  BackgroundColourController.m
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import "BackgroundColourController.h"

@interface BackgroundColourController () <UITextFieldDelegate>
@property (nonatomic, copy) NSString* controllerName;
@property NSUInteger level;
@end

@implementation BackgroundColourController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(instancetype)initWithName:(NSString*)name andLevel:(NSUInteger) level{
    if(self = [super init]){
        _controllerName = name;
        _level = level;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1];
    
    
    [_nextLevelButton setTitle:[NSString stringWithFormat:@"%@ : %d", self.controllerName, self.level] forState:UIControlStateNormal];
    [_nextLevelButton addTarget:self action:@selector(nextLevelButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    _textField.delegate = self;
    
    [_redSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_greenSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_blueSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}
-(void)nextLevelButtonTap:(UIButton*)sender
{
    BackgroundColourController* bcc = [[BackgroundColourController alloc]initWithName:(NSString*)self.controllerName
                                                                             andLevel:self.level+1];
    [self.navigationController pushViewController:bcc animated:YES];
}
-(void)sliderValueChanged:(UISlider*)sender
{
    self.view.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1];
}
-(BOOL)textFieldShouldReturn:(UITextField*)sender
{
    NSUInteger red = 0;
    NSUInteger green = 0;
    NSUInteger blue = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:[sender.text substringWithRange:(NSRange){0,2}]];
    [scanner setScanLocation:0];
    [scanner scanHexInt:&red];
    
    scanner = [NSScanner scannerWithString:[sender.text substringWithRange:(NSRange){2,2}]];
    [scanner setScanLocation:0];
    [scanner scanHexInt:&green];
    
    scanner = [NSScanner scannerWithString:[sender.text substringWithRange:(NSRange){4,2}]];
    [scanner setScanLocation:0];
    [scanner scanHexInt:&blue];
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    [self.view endEditing:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
