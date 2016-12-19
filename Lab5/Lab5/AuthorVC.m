#import "AuthorVC.h"

@implementation AuthorVC

- (IBAction)fullDetailButtonClicked:(id)sender {
    AuthorDetailsVC *authorDetailsVC = [AuthorDetailsVC new];
    [self showViewController:authorDetailsVC sender:self];
    
}
- (IBAction)showAnswerButtonClicked:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"I'm just an alert" message:@"Click OK, please" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:okButton];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
