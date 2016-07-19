
#import "AuthorVC.h"

@interface AuthorVC ()

@end

@implementation AuthorVC

- (IBAction)showAlertView:(id)sender
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertController *__weak weakAlert = alert;
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakAlert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
