//
//  ColoredVC.m
//  lab-5-uikit
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "ColoredVC.h"
#import "UIColor+HexColor.h"

@interface ColoredVC ()

@property (nonatomic, copy) NSString *titlePrefix;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UITextField *colorTextInput;
// 0 - Red, 1 - Green, 2 - Blue
@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *colorSliders;

- (NSString *)completeToHexString:(NSString *)string;

@end


@implementation ColoredVC

CGFloat colorValues[3];

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix andDepth:(unsigned int)depth {
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    
    _depth = depth;
    _titlePrefix = [NSString stringWithString:titlePrefix];
    
    return self;
}

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix {
    self = [self initWithTitlePrefix:titlePrefix andDepth:0];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:[NSString stringWithFormat:@"%@ %i", self.titlePrefix, self.depth]];
    
    for (UISlider *slider in self.colorSliders) {
        [self colorValueChanged:slider];
    }
    
}

- (IBAction)nextButtonTap:(UIButton *)sender {
    ColoredVC *nextScreenVC = [[ColoredVC alloc]
        initWithTitlePrefix:self.titlePrefix andDepth:(self.depth+1)];
    
    [self.navigationController pushViewController:nextScreenVC animated:YES];
}

- (IBAction)colorValueChanged:(UISlider *)sender {
    int colorIndex = [self.colorSliders indexOfObject:sender];
    
    colorValues[colorIndex] = sender.value;
    
    self.view.backgroundColor = [UIColor
        colorWithRed:colorValues[0]
        green:colorValues[1]
        blue:colorValues[2]
        alpha:1
    ];
    
    // create hex-string representation of background color
    NSMutableString *resultColorString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < 3; i++) {
        int channelValue = lroundf(colorValues[i] * 255);
        [resultColorString appendFormat:@"%02x", channelValue];
    }
    
    self.colorTextInput.text = resultColorString;
}

// complete too short (< 6 characters) string with zeros
// to length = 6
- (NSString *)completeToHexString:(NSString *)string {
    if ([string length] < 6) {
        NSMutableString *fixedString = [NSMutableString stringWithString:string];
        
        while ([fixedString length] < 6) {
            [fixedString appendString:@"0"];
        }
        
        return [NSString stringWithString:fixedString];
    }
    
    return string;
}

// text field deleagte
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
    replacementString:(NSString *)string {
    
    NSMutableString *newString = [NSMutableString stringWithString:textField.text];
    [newString replaceCharactersInRange:range withString:string];
    
    NSString * const fullStringRegExp = @"^[0-9A-F]{0,6}";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:fullStringRegExp
        options:NSRegularExpressionCaseInsensitive
        error:&error];
    
    if (error) {
        NSLog(@"HEX color validarion regexp error:\n %@", error);
    }

    NSTextCheckingResult *match = [regex
        firstMatchInString:newString
        options:0
        range:NSMakeRange(0, [newString length])];

    return match.range.length == [newString length];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text length] < 6) {
        textField.text = [self completeToHexString:textField.text];
    }
    
    UIColor *newColor = [UIColor colorWithHexString:textField.text];
    self.view.backgroundColor = newColor;
    
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    CGFloat alpha = 0;
    
    [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    [(UISlider *)self.colorSliders[0] setValue:red];
    [(UISlider *)self.colorSliders[1] setValue:green];
    [(UISlider *)self.colorSliders[2] setValue:blue];
}

@end
