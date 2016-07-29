//
//  AthorViewController.m
//  VC-practice
//

#import "AthorViewController.h"
#import "MoreInfoVCDelegateProtocol.h"
#import "MoreInfoVC.h"

@interface AthorViewController ()<MoreInfoVCDelegate>

@end

@implementation AthorViewController

- (IBAction)makeAllert:(id)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Attention"
                                                                   message:@"Try another button"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok, I'll try"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {}];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowMoreInfoID"]) {
        MoreInfoVC *vc = segue.destinationViewController;
        vc.delegate = self;
    }
    
}

#pragma mark - MoreInfoVCDelegate methods

- (void)cancelDidTouch:(MoreInfoVC *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
