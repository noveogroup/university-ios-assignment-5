//
//  AuthorViewController.m
//  Fifth_task
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 MyCompanyName. All rights reserved.
//

#import "AuthorViewController.h"

@interface AuthorViewController ()

@end

@implementation AuthorViewController

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
    
    self.view.backgroundColor = [UIColor brownColor];
    
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.textView.backgroundColor = [UIColor greenColor];
    self.textView.editable = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Message"
                                                   message:@"You clicked on alert button"
                                                  delegate:nil cancelButtonTitle:@"I'm fine"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
@end
