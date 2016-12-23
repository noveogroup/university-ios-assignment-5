//
//  InformationViewController.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/5/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "InformationViewController.h"
#import "UIColor+Extensions.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set start background color.
    UIColor *bgColor = [UIColor safestVioletColor];
    
    self.view.backgroundColor = bgColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// For opportunity to return back.
- (void)infoViewFinished:(InformationViewController *)infoVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Got to new activity with user information.
- (IBAction)fullInfoButtonTap:(id)sender
{
    ViewController *viewController = [[ViewController alloc] init];
    viewController.delegate = self;
    
    [self presentViewController:viewController animated:YES completion: nil];
}

// Show alert dialog with user information.
- (IBAction)aboutButtonTap:(id)sender
{
    NSString *description = @"Full name: Ivan Bukshev\nAge: 19\n\nCity: Novosibirsk\nUniversity: NSU\nDepartment: IT";
    UIAlertView *descrInfo = [[UIAlertView alloc] initWithTitle:@"User Information"
                                                        message:description
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    [descrInfo show];
}

@end
