
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSCharacterSet *nonHex;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *colorTextFiled;
@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;
@property (nonatomic) NSUInteger count;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nonHex = [[NSCharacterSet
                               characterSetWithCharactersInString: @"0123456789ABCDEFabcdef"]
                              invertedSet];
    
    self.redColorSlider.value = (arc4random() % 255) / 255.0;
    self.greenColorSlider.value = (arc4random() % 255) / 255.0;
    self.blueColorSlider.value = (arc4random() % 255) / 255.0;
    
    [self sliderValueChanged:self];
    
    self.navigationItem.title = self.navigationController.title;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.label.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.count];
}

- (IBAction)gotoNextVC:(id)sender
{
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.count = self.count + 1;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sliderValueChanged:(id)sender
{
    float red = self.redColorSlider.value;
    float green = self.greenColorSlider.value;
    float blue = self.blueColorSlider.value;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.colorTextFiled.text = [NSString stringWithFormat:@"%x%x%x", (int)(red * 255), (int)(green * 255), (int)(blue * 255)];
}

- (IBAction)colorTextFieldChanged:(id)sender
{
    NSString *colorText = self.colorTextFiled.text;
    
    NSRange nonHexRange = [colorText rangeOfCharacterFromSet:self.nonHex];
    BOOL isHex = (nonHexRange.location == NSNotFound);
    
    if (colorText.length != 6 || !isHex) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid hex color" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    
    unsigned int red, green, blue;
    NSScanner* scanner = [NSScanner scannerWithString:[colorText substringWithRange:NSMakeRange(0, 2)]];
    [scanner scanHexInt:&red];
    scanner = [NSScanner scannerWithString:[colorText substringWithRange:NSMakeRange(2, 2)]];
    [scanner scanHexInt:&green];
    scanner = [NSScanner scannerWithString:[colorText substringWithRange:NSMakeRange(4, 2)]];
    [scanner scanHexInt:&blue];
    
    self.redColorSlider.value = red / 255.0;
    self.greenColorSlider.value = green / 255.0;
    self.blueColorSlider.value = blue / 255.0;
    
    [self sliderValueChanged:self];
    
    [self resignFirstResponder];
}

@end

















