

#import "ColorVC.h"

@interface ColorVC ()

@end

@implementation ColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"ColorVC (%d)",[self.navigationController.viewControllers indexOfObject:self]];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonTapped)];
    self.navigationItem.rightBarButtonItem = next;

}

- (void)nextButtonTapped
{
    ColorVC *newVC = [[ColorVC alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
}



@end
