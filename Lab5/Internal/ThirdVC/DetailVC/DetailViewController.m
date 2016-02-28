
#import "DetailViewController.h"

NSString* kDetailStoryboardName = @"detail";
NSString* kDetailViewControllerID = @"DetailViewController";

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - navigation
- (IBAction)closeDetailVCAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
