
#import "ColorVC.h"
#import "UIColor+HexColor.h"

@interface ColorVC ()

@property (weak, nonatomic) IBOutlet UITextField *colorTextFiled;
@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;

@end

@implementation ColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.redColorSlider.value = (arc4random() % 255) / 255.0;
    self.greenColorSlider.value = (arc4random() % 255) / 255.0;
    self.blueColorSlider.value = (arc4random() % 255) / 255.0;
    
    [self sliderValueChanged:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %lu", self.navigationController.title, self.navigationController.viewControllers.count];
}

- (IBAction)gotoNextVC:(id)sender
{
    ColorVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sliderValueChanged:(id)sender
{
    float red = self.redColorSlider.value;
    float green = self.greenColorSlider.value;
    float blue = self.blueColorSlider.value;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.colorTextFiled.text = [NSString stringWithFormat:@"%02X%02X%02X", (int)(red * 255), (int)(green * 255), (int)(blue * 255)];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSError *error = nil;
    UIColor *color = [UIColor colorWithHexString:newString error:&error];
    
    if (error) {
        if (error.code == HexColorErrorInvalidCharacter || error.code == HexColorErrorLenghtIsGreaterThan6) {
            return NO;
        }
        else {
            return YES;
        }
    }

    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    self.redColorSlider.value = red;
    self.greenColorSlider.value = green;
    self.blueColorSlider.value = blue;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSError *error = nil;
    [UIColor colorWithHexString:textField.text error:&error];
    
    if (error) {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:error.domain message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:NULL]];
        [self presentViewController:alert animated:YES completion:nil];
        
        return NO;
    }
    [textField resignFirstResponder];
    return YES;
}

@end

















