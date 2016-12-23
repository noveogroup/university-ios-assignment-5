

#import "ColorVC.h"
#import "UIColor+Hexadecimal.h"

@interface ColorVC ()

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;

@end

@implementation ColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"ColorVC (%d)",[self.navigationController.viewControllers indexOfObject:self]];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonTapped)];
    self.navigationItem.rightBarButtonItem = next;
    
    
    [self.redSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.greenSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.blueSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self sliderValueChanged];

}

- (void)nextButtonTapped
{
    ColorVC *newVC = [[ColorVC alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
}

- (void)setBackgroundColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)sliderValueChanged
{
    [self setBackgroundColorWithRed:[self.redSlider value] green:[self.greenSlider value] blue:[self.blueSlider value]];
    self.colorTextField.text = [self.view.backgroundColor hexColorString];
}




- (IBAction)dsfsdg:(id)sender {
}
@end
