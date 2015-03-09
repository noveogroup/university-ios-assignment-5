#import "AboutVC.h"


@interface AboutVC ()
@end


@implementation AboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)alertButtonTapped:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Alert"
                                message:@"Alert button has been tapped!"
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAlert = [UIAlertAction
                                 actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:closeAlert];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)moreInfoButtonTapped:(UIButton *)sender {
    // TODO: Implement this
}

@end
