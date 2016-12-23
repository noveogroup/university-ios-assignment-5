
#import "AutorInfoVC.h"
#import "FullInformationVC.h"

@interface AutorInfoVC ()
@end

@implementation AutorInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)AboutInfo {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Test alert" message:@"This is test with alert" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (IBAction)FullInfo {
    FullInformationVC *fullInfoVC = [[FullInformationVC alloc] init];
    
    
    [self presentViewController:fullInfoVC animated:YES completion:nil];
}
@end
