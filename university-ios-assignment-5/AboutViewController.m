//
//  AboutViewController.m
//  university-ios-assignment-5
//
//  Created by admin on 14/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import "AboutViewController.h"
#import "DetailInfoViewController.h"

NSString *kSegueidentifierShowDetail = @"showDetail";

@interface AboutViewController () <DetailInfoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)firstButtonTouchedUpInside:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert title" message:@"Alert message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)secondButtonTouchedUpInside:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Show detail?"
                                 message:@"Do you want to look at detail?"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes, please"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    [self performSegueWithIdentifier:kSegueidentifierShowDetail sender:self];
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"No, thanks"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)closeDetailInfo
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueidentifierShowDetail])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        DetailInfoViewController *playerDetailsViewController = navigationController.viewControllers.lastObject;
        playerDetailsViewController.delegate = self;
    }
}

@end
