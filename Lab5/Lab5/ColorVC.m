#import "ColorVC.h"

@interface ColorVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *colorTF;
@property (weak, nonatomic) IBOutlet UIView *innerView;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation ColorVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@.%@", self.title, self.titleDeepCount]];

    UIBarButtonItem *createNewVCButton = [[UIBarButtonItem alloc] initWithTitle:@"Create new" style:UIBarButtonItemStylePlain target:self action:@selector(createNewViewController)];
    [self.navigationItem setRightBarButtonItem:createNewVCButton];

}

- (void) createNewViewController
{
    ColorVC *newVC = [ColorVC new];
    newVC.title = self.title;
    newVC.titleDeepCount = @([self.titleDeepCount integerValue] + 1);
    [self.navigationController pushViewController:newVC animated:YES];
}

- (IBAction)dragSliders:(id)sender
{
    [self setViewBackgroundColor];
    self.colorTF.text = [[NSString stringWithFormat:@"%02x%02x%02x", (int)(self.redSlider.value*255), (int)(self.greenSlider.value*255), (int)(self.blueSlider.value*255)] uppercaseString];
}

- (void)setViewBackgroundColor {
    self.view.backgroundColor = self.innerView.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];

    if((self.redSlider.value + self.greenSlider.value + self.blueSlider.value) < 0.8){
        self.redLabel.textColor = [UIColor whiteColor];
        self.greenLabel.textColor = [UIColor whiteColor];
        self.blueLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor whiteColor];
    } else {
        self.redLabel.textColor = [UIColor blackColor];
        self.greenLabel.textColor = [UIColor blackColor];
        self.blueLabel.textColor = [UIColor blackColor];
        self.titleLabel.textColor = [UIColor blackColor];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSMutableString *futureString = [[self.colorTF.text stringByReplacingCharactersInRange:range withString:string] mutableCopy];
    if([self validateString:futureString]){
        while (futureString.length < 6){
            [futureString appendString:@"0"];
        }
        [self changeBGColorByTextFieldWith:futureString];
        return YES;
    }
    return NO;
}

- (BOOL)changeBGColorByTextFieldWith:(NSString *)str
{
    unsigned colorInt = 0;
    [[NSScanner scannerWithString:str] scanHexInt:&colorInt];

    double valueForRedSlider = ((colorInt & 0xFF0000) >> 16) / 255.0;
    self.redSlider.value = (float)valueForRedSlider;
    double valueForGreenSlider = ((colorInt & 0xFF00) >> 8) / 255.0;
    self.greenSlider.value = (float)valueForGreenSlider;
    double valueForBlueSlider = (colorInt & 0xFF) / 255.0;
    self.blueSlider.value = (float)valueForBlueSlider;

    [self setViewBackgroundColor];

    return YES;
}

- (BOOL)validateString:(NSString *)string
{
    if(string.length > 6) {
        return NO;
    }
    
    NSCharacterSet *charsToRemove = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet];
    return [string rangeOfCharacterFromSet:charsToRemove].location == NSNotFound;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return NO;
}

@end
