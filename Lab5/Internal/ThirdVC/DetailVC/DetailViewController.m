
#import "DetailViewController.h"

@implementation DetailViewController

#pragma mark - navigation
- (IBAction)closeDetailVCAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
