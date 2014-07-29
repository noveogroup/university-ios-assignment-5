#import "RecursiveVC.h"

@interface RecursiveVC ()<UITextFieldDelegate>

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSString *nib;
@property (nonatomic) int depth;
@property (nonatomic, strong) NSString *name;

@end

@implementation RecursiveVC

@synthesize field;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil name:(NSString *)name
{
	self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil depth:0 name:name];

	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil depth: (int) depth name:(NSString *)name
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

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

	self.title = [NSString stringWithFormat:@"%@: %d", self.name, self.depth];
	self.navigationController.title = self.name;
	self.field.delegate = self;

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
																				bundle:self.bundle
																				 depth:self.depth + 1
																				  name:self.name]
										 animated:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	NSError *error = nil;
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"#[0-9 a-f]{6}" options:NSRegularExpressionCaseInsensitive error:&error];

	if (regex != nil)
	{
		NSUInteger matches = [regex numberOfMatchesInString:textField.text options:0 range:NSMakeRange(0, [textField.text length])];

		if (1 == matches)
		{
			unsigned red = 0;
			unsigned green = 0;
			unsigned blue = 0;

			[[NSScanner scannerWithString:[textField.text substringWithRange:(NSRange){1, 2}]] scanHexInt:&red];
			[[NSScanner scannerWithString:[textField.text substringWithRange:(NSRange){3, 2}]] scanHexInt:&green];
			[[NSScanner scannerWithString:[textField.text substringWithRange:(NSRange){5, 2}]] scanHexInt:&blue];


			[self setColorWithRed:1.0f * red / 255
							green:1.0f * green / 255
							 blue:1.0f * blue / 255
							alpha:1];
		}
	}

	[[self view] endEditing:YES];

	return NO;
}

- (IBAction) redSliderChanged:(UISlider *)sender
{
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	CGFloat alpha;

	[self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];

	red = sender.value;

	[self setColorWithRed:red green:green blue:blue alpha:alpha];
}

- (IBAction) greenSliderChanged:(UISlider *)sender
{
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	CGFloat alpha;

	[self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];

	green = sender.value;

	[self setColorWithRed:red green:green blue:blue alpha:alpha];
}

- (IBAction) blueSliderChanged:(UISlider *)sender
{
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	CGFloat alpha;

	[self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];

	blue = sender.value;

	[self setColorWithRed:red green:green blue:blue alpha:alpha];
}

- (void) setColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
	self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

	[self.redSlider setValue:red animated:YES];
	[self.greenSlider setValue:green animated:YES];
	[self.blueSlider setValue:blue animated:YES];

	self.field.text = [NSString stringWithFormat:@"#%02x%02x%02x", (unsigned int) round(red * 255), (unsigned int) round(green * 255), (unsigned int) round(blue * 255)];
}

@end
