
#import "UIColor+hexStringDecoding.h"

static NSString* const allCharacters = @"0123456789ABCDEF";

@implementation UIColor (hexStringDecoding)

+ (UIColor *)colorWithHexString:(NSString *)string{
    
    UIColor* color = [[UIColor alloc] init];
    //findRedComponent
    NSString* redHexString = [string substringWithRange:NSMakeRange(1, 2)];
    NSUInteger redValue = [color getDecValueFromHexString:redHexString];
    
    //findGreenComponent
    NSString* greenHexString = [string substringWithRange:NSMakeRange(3, 2)];
    NSUInteger greenValue = [color getDecValueFromHexString:greenHexString];
    
    //findBlueComponent
    NSString* blueHexString = [string substringWithRange:NSMakeRange(5, 2)];
    NSUInteger blueValue = [color getDecValueFromHexString:blueHexString];
    
    UIColor* newColor = [UIColor colorWithRed:(float)redValue/255.f green:(float)greenValue/255.f blue:(float)blueValue/255.f alpha:1.f];
    
    return newColor;
}

- (NSUInteger) getDecValueFromHexString:(NSString *)string
{
    if (string.length != 2) {
        return 0;
    } else {
        
        NSUInteger value = 0;
        
        for (int i = 0; i < string.length; i++) {
            NSUInteger decValue = [allCharacters rangeOfString:[string substringWithRange:NSMakeRange(i, 1)]].location;
            value += decValue * powf(16, string.length - 1 - i);
        }
        
        return value;
    }
}
 

- (NSString *)hexString
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    NSString* newString = [NSString stringWithFormat:@"#%@%@%@", [self getHexStringFromFloatValue:red], [self getHexStringFromFloatValue:green], [self getHexStringFromFloatValue:blue]];
    return newString;
}

- (NSString*) getHexStringFromFloatValue:(CGFloat) value
{
    if (value >= 1 && value <=0) {
        return nil;
    }
    
    NSUInteger decValue = value * 255;
    
    NSUInteger secondVal = decValue%16;
    NSUInteger firstVal = (decValue - secondVal)/16;
    
    NSString* string = [NSString stringWithFormat:@"%@%@", [allCharacters substringWithRange:NSMakeRange(firstVal, 1)], [allCharacters substringWithRange:NSMakeRange(secondVal, 1)]];
    
    return string;
}
@end
