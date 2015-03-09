#import "AuthorDetailsVC.h"


@interface AuthorDetailsVC ()
@end


@implementation AuthorDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)closeButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
