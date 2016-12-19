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

    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@.%@", self.title, _titleDeepCount]];

    UIBarButtonItem *createNewVCButton = [[UIBarButtonItem alloc] initWithTitle:@"Create new" style:UIBarButtonItemStylePlain target:self action:@selector(createNewViewController)];
    [self.navigationItem setRightBarButtonItem:createNewVCButton];

}

- (void) createNewViewController
{
    ColorVC *newVC = [ColorVC new];
    newVC.title = self.title;
    newVC.titleDeepCount = @([_titleDeepCount integerValue] + 1);
    [self.navigationController pushViewController:newVC animated:YES];
}

- (IBAction)dragSliders:(id)sender
{
    [self setViewBackgroundColor];
    _colorTF.text = [[NSString stringWithFormat:@"%02x%02x%02x", (int)(_redSlider.value*255), (int)(_greenSlider.value*255), (int)(_blueSlider.value*255)] uppercaseString];
}

- (void)setViewBackgroundColor {
    self.view.backgroundColor = _innerView.backgroundColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1];

    if((_redSlider.value + _greenSlider.value + _blueSlider.value) < 0.8){
        _redLabel.textColor = [UIColor whiteColor];
        _greenLabel.textColor = [UIColor whiteColor];
        _blueLabel.textColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor whiteColor];
    } else {
        _redLabel.textColor = [UIColor blackColor];
        _greenLabel.textColor = [UIColor blackColor];
        _blueLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) return YES;

    unichar newLetter = [string characterAtIndex:0];
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"];

    UITextRange *selRange = _colorTF.selectedTextRange;
    UITextPosition *selStartPos = selRange.start;
    NSInteger cursorPosition = [_colorTF offsetFromPosition:_colorTF.beginningOfDocument toPosition:selStartPos];

    if ([charSet characterIsMember:newLetter]) {
        return [self changeBGColorByTextFieldWith:newLetter at:(NSUInteger)cursorPosition];
    }
    return NO;
}

- (BOOL)changeBGColorByTextFieldWith:(unichar)newLetter at:(NSUInteger)position {

    if ([_colorTF.text length] > 5) {
        return NO;
    }

    NSMutableString *str = [self prepareStringForChangeColorWith:[_colorTF.text mutableCopy] and:newLetter at:position];

    unsigned colorInt = 0;
    [[NSScanner scannerWithString:str] scanHexInt:&colorInt];

    double valueForRedSlider = ((colorInt & 0xFF0000) >> 16) / 255.0;
    _redSlider.value = (float)valueForRedSlider;
    double valueForGreenSlider = ((colorInt & 0xFF00) >> 8) / 255.0;
    _greenSlider.value = (float)valueForGreenSlider;
    double valueForBlueSlider = (colorInt & 0xFF) / 255.0;
    _blueSlider.value = (float)valueForBlueSlider;

    [self setViewBackgroundColor];

    return YES;
}

- (NSMutableString *)prepareStringForChangeColorWith:(NSMutableString *)string and:(unichar)newLetter at:(NSUInteger)position
{
    while (string.length < 5){
        [string appendString:@"0"];
    }
    [string insertString:[NSString stringWithFormat:@"%c", newLetter] atIndex:position];
    return string;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return NO;
}

@end
