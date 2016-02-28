
#import "DetailViewController.h"

NSString* kDetailStoryboardName = @"detail";
NSString* kDetailViewControllerID = @"DetailViewController";

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark - navigation
- (IBAction)closeDetailVCAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
