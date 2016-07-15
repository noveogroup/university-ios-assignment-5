//
//  AthorViewController.m
//  VC-practice
//

#import "AthorViewController.h"

@interface AthorViewController ()

@end

@implementation AthorViewController

- (IBAction)MakeAllert:(id)sender
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

@end
