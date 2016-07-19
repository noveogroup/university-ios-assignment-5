
#import "ColorVC.h"
#import "UIColor+HexColor.h"

@interface ColorVC ()

@property (nonatomic) NSCharacterSet *nonHex;
@property (weak, nonatomic) IBOutlet UITextField *colorTextFiled;
@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;
@property (copy, nonatomic) NSString *lastValidColorString;

@end

@implementation ColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nonHex = [[NSCharacterSet characterSetWithCharactersInString: @"0123456789ABCDEFabcdef"] invertedSet];
    
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
    ColorVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ColorVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sliderValueChanged:(id)sender
{
    float red = self.redColorSlider.value;
    float green = self.greenColorSlider.value;
    float blue = self.blueColorSlider.value;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.lastValidColorString = [NSString stringWithFormat:@"%02X%02X%02X",
                                 (int)(red * 255), (int)(green * 255), (int)(blue * 255)];
    self.colorTextFiled.text = self.lastValidColorString;
}

- (IBAction)colorTextFieldDidEndOnExit:(id)sender
{
    NSError *error = nil;
    UIColor *color = [UIColor colorWithHexString:self.colorTextFiled.text error:&error];
    
    if (color == nil) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:error.domain message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertController *__weak weakAlert = alert;
        
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakAlert dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        self.colorTextFiled.text = self.lastValidColorString;
    }
}

- (IBAction)colorTextFieldEditingChanged:(id)sender
{
    CGFloat red, green, blue, alpha;
    
    NSError *error = nil;
    UIColor *color = [UIColor colorWithHexString:self.colorTextFiled.text error:&error];
    
    if (color != nil) {
        
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
        
        self.redColorSlider.value = red;
        self.greenColorSlider.value = green;
        self.blueColorSlider.value = blue;
        
        [self sliderValueChanged:self];
        [self resignFirstResponder];
    }
    else if (error.code == HexColorErrorInvalidCharacter || error.code == HexColorErrorLenghtIsGreaterThan6) {
        
        self.colorTextFiled.text = self.lastValidColorString;
    }
}

@end

















