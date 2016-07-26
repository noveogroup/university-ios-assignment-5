
#import "AuthorVC.h"
#import "AboutVC.h"


@interface AuthorVC () <AboutVCDelegate>

@end


@implementation AuthorVC

- (IBAction)showAlertView:(id)sender
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:NULL]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FromAuthorToAbout"]) {
        
        AboutVC *aboutVC = [segue destinationViewController];
        
        aboutVC.delegate = self;
    }
}

- (void)aboutViewControllerDidFinish:(AboutVC *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end













