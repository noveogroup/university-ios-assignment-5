#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _barButtonBack.target = self.barButtonBack;
    _barButtonBack.action = @selector(revealToggle:);
}




- (IBAction)showAlertAction:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Тут можно посмотреть информацию об авторе" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)showDetailInfoAction:(id)sender {
    
}

@end
