//
//  ThirdTabViewController.m
//  Task5
//
//  Created by Sergey Plotnikov on 14.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import "ThirdTabViewController.h"
#import "AuthorViewController.h"

@interface ThirdTabViewController () <AuthorViewControllerDelegate>

@end

@implementation ThirdTabViewController

- (void)didCloseViewController:(AuthorViewController *)authorViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showMessage
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Подробная информация об авторе"
        message:@"Для выхода нажмите 'Cancel'" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                        handler:nil];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowAuthorVCSegueID"]) {
        AuthorViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

@end
