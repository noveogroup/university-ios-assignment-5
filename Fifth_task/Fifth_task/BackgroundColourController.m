//
//  BackgroundColourController.m
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import "BackgroundColourController.h"

@interface BackgroundColourController () <UITextFieldDelegate>

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
                                                green:self.greenSlider.value
                                                 blue:self.blueSlider.value
                                                alpha:1];
    if(!!self.navigationController){
        NSUInteger index = [self.navigationController.viewControllers indexOfObject:self];
        self.navigationItem.title = [NSString stringWithFormat:@"%@ : %d",self.navigationController.title,index];
    }
    
    self.textField.delegate = self;
}

- (IBAction)sliderValueChanged:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
                                                green:self.greenSlider.value
                                                 blue:self.blueSlider.value
                                                alpha:1];
}
-(BOOL)textFieldShouldReturn:(UITextField*)sender
{
    self.view.backgroundColor = [UIColor colorWithHexRGB:self.textField.text];
    
    [self.view endEditing:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextLevelButtonTap:(id)sender {
    if(!!self.navigationController){
        BackgroundColourController* bcc = [[BackgroundColourController alloc]init];
        [self.navigationController pushViewController:bcc animated:YES];
    }
}
@end
