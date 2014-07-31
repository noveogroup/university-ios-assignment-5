//
//  InformationVC.m
//  lab-5-uikit
//
//  Created by Admin on 30/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "InformationVC.h"
#import "ModalVC.h"

@interface Information

- (IBAction)alertButtonTap:(id)sender;
- (IBAction)modalButtonTap:(id)sender;

@end

@implementation InformationVC

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
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)alertButtonTap:(id)sender {
    UIAlertView *infoAlert = [[UIAlertView alloc]
        initWithTitle:@"Алексей Ершов"
        message:NSLocalizedString(@"AUTHOR_INFO_LONG", @"Long version of info about author")
        delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles: nil
    ];
    
    [infoAlert show];
}

- (IBAction)modalButtonTap:(id)sender {

    // Create the navigation controller and present it.
   ModalVC *modalVC = [[ModalVC alloc] init];
   modalVC.delegate = self;
    
   [self presentViewController:modalVC animated:YES completion: nil];
}

// modal view presenter delegate
- (void)modalViewFinished:(ModalVC *)modalVC {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
