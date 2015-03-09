

#import "ColorVC.h"

@interface ColorVC ()

@end

@implementation ColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"ColorVC (%d)",[self.navigationController.viewControllers indexOfObject:self]];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonTapped)];
    self.navigationItem.rightBarButtonItem = next;
    
    [self setBackgroundColorWithRed:[self.redSlider value] green:[self.greenSlider value] blue:[self.blueSlider value]];
    
    [self.redSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.greenSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.blueSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    
    self.colorTextField.text = [self hexStringForColor:self.view.backgroundColor];

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
    self.colorTextField.text = [self hexStringForColor:self.view.backgroundColor];
}

- (NSString *)hexStringForColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}


@end
