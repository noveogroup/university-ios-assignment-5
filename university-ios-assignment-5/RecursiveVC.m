#import "RecursiveVC.h"
#import "UIColor+Parsable.h"

@interface RecursiveVC ()<UITextFieldDelegate>

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSString *nib;
@property (nonatomic) int depth;
@property (nonatomic, strong) NSString *name;

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

    if (self)
	{
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UIColor *newColor = [UIColor getColorByHEXString:textField.text];

    if (newColor != nil) {
        self.view.backgroundColor = newColor;
    }

	[self.view endEditing:YES];

	return NO;
}

- (IBAction)sliderChanged:(UISlider *)sender
{
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	CGFloat alpha;

	[self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];

    if (sender == self.redSlider) {
        red = sender.value;
    }
    else if (sender == self.greenSlider) {
        green = sender.value;
    }
    else if (sender == self.blueSlider) {
        blue = sender.value;
    }

	[self setColorWithRed:red green:green blue:blue alpha:alpha];
}

- (void) setColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
	self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

	[self.redSlider setValue:red animated:YES];
	[self.greenSlider setValue:green animated:YES];
	[self.blueSlider setValue:blue animated:YES];

    self.field.text = [UIColor RGBStringWithRed:red green:green blue:blue];
}

@end
