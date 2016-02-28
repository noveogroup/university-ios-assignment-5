
#import "MoreInfoVC.h"

@interface MoreInfoVC ()
- (IBAction)actionClose:(UIButton *)sender;

@end

@implementation MoreInfoVC



#pragma mark - Actions

- (IBAction)actionClose:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
