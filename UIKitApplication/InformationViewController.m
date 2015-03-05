//
//  InformationViewController.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/5/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)infoViewFinished:(InformationViewController *)infoVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)fullInfoButtonTap:(id)sender
{
    ViewController *viewController = [[ViewController alloc] init];
    viewController.delegate = self;
    
    [self presentViewController:viewController animated:YES completion: nil];
}

- (IBAction)aboutButtonTap:(id)sender
{
    NSString *description = @"Full name: Ivan Bukshev\n\nAge: 19\n\nCity: Novosibirsk\n\nUniversity: NSU\n\nDepartment: IT\n\n\n\n\n\nAnd...\nThat's all.";
    
    UIAlertView *descrInfo = [[UIAlertView alloc] initWithTitle:@"Ivan Bukshev"
                                                        message:description
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    [descrInfo show];
}

@end
