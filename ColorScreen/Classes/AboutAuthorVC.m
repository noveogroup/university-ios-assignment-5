

#import "AboutAuthorVC.h"
#import "MoreInfoVC.h"

@interface AboutAuthorVC ()
- (IBAction)actionMoreInfo:(UIButton *)sender;
- (IBAction)actionViewAlert:(UIButton *)sender;

@end

@implementation AboutAuthorVC




#pragma mark - Actions

- (IBAction)actionMoreInfo:(UIButton *)sender {
    
    MoreInfoVC *moreVC = [[MoreInfoVC alloc]
                          initWithNibName:NSStringFromClass([MoreInfoVC class])
                          bundle:[NSBundle mainBundle]];
    
    
    [self presentViewController:moreVC
                       animated:YES
                     completion:nil];

}

- (IBAction)actionViewAlert:(UIButton *)sender {
    
    NSString *title = @"Warning";
    NSString *alertMessage = @"Alert message";
    NSString *cancelButton = @"Cancel";
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:alertMessage
                                                           delegate:self
                                                  cancelButtonTitle:cancelButton
                                                  otherButtonTitles:nil];
        [alertView show];
        
        
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:alertMessage
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButton
                                                               style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
    

    
    

}
@end
