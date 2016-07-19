

//
//  AuthorViewController.m
//  Task5
//
//  Created by Sergey Plotnikov on 15.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "AuthorViewController.h"

@implementation AuthorViewController

- (IBAction)didClose:(id)sender
{
    [self.delegate didCloseViewController:self];
}


@end
