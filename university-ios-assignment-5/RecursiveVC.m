#import "RecursiveVC.h"
#import "UIColor+Parsable.h"

@interface RecursiveVC ()<UITextFieldDelegate>

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSString *nib;
@property (nonatomic) int depth;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) IBOutlet UITextField *field;

@property (nonatomic, strong) IBOutlet UISlider *redSlider;
@property (nonatomic, strong) IBOutlet UISlider *greenSlider;
@property (nonatomic, strong) IBOutlet UISlider *blueSlider;

@end

@implementation RecursiveVC

@synthesize field;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
        name:(NSString *)name
{
	self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil depth:0 name:name];

	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
        depth: (int) depth name:(NSString *)name
{
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
		self.bundle = nibBundleOrNil;
		self.nib = nibNameOrNil;
		self.depth = depth;
		self.name = name;
	}

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = [NSString stringWithFormat:@"%@: %d", self.name, self.depth];
    self.field.placeholder = @"#RRGGBB";

    [self initControls];
}

- (void)initControls
{
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	CGFloat alpha;

    [self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
	[self setColorWithRed:red green:green blue:blue alpha:alpha];
}

- (IBAction)goDeeper:(id)sender
{
    [self.navigationController pushViewController:[[RecursiveVC alloc] initWithNibName:self.nib
            bundle:self.bundle depth:self.depth + 1 name:self.name] animated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
        replacementString:(NSString *)string
{
    //allow backspace
    if ([string length] == 0) {
        return YES;
    }

    NSString *result = [textField.text stringByReplacingCharactersInRange:range
            withString:[string uppercaseString]];

    if ([UIColor isValidHEXString:result]) {
        textField.text = result;

        UITextPosition *start = [field positionFromPosition:[field beginningOfDocument]
                offset:range.location + [string length]];

        [field setSelectedTextRange:[field textRangeFromPosition:start toPosition:start]];
    }
    else {
        [self shakeTextField:textField];
    }

    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;

    if ([UIColor getRed:&red green:&green blue:&blue fromHEXString:textField.text]) {
        [self setColorWithRed:red green:green blue:blue alpha:1];

        [self.view endEditing:YES];
    }
    else {
        [self shakeTextField:textField];
    }

	return NO;
}

- (IBAction)sliderChanged:(UISlider *)sender
{
	[self setColorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value
            alpha:1];
}

- (void) setColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
	self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

	[self.redSlider setValue:red animated:YES];
	[self.greenSlider setValue:green animated:YES];
	[self.blueSlider setValue:blue animated:YES];

    self.field.text = [UIColor RGBStringWithRed:red green:green blue:blue];
}

- (void)shakeTextField:(UITextField *)textField
{
    [UIView animateWithDuration:0.1 delay:0
            options:UIViewAnimationOptionCurveEaseIn
            animations:^{
        CGRect frame = textField.frame;

        frame.origin.x -= 10;

        textField.frame = frame;
    }
            completion:^(BOOL flag){

        [UIView animateWithDuration:0.2 delay:0
                options:UIViewAnimationOptionCurveEaseIn
                animations:^{
            CGRect frame = textField.frame;

            frame.origin.x += 20;

            textField.frame = frame;
        }
                completion:^(BOOL flag2){
            [UIView animateWithDuration:0.1 delay:0
                    options:UIViewAnimationOptionCurveEaseIn
                    animations:^{
                CGRect frame = textField.frame;

                frame.origin.x -= 10;

                textField.frame = frame;
            }
                    completion:^(BOOL flag3){}];
        }];
    }];
}

@end
