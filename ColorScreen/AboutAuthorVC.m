

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
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!"
                                                                   message:@"Alert message."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

}
@end
