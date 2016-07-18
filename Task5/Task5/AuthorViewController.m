

//
//  AuthorViewController.m
//  Task5
//
//  Created by Sergey Plotnikov on 15.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "AuthorViewController.h"

@interface AuthorViewController ()

@end

@implementation AuthorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didClose:(id)sender
{
    [self.delegate didCloseViewController:self];
}


@end
