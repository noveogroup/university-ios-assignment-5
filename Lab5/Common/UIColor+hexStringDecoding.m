
#import "UIColor+hexStringDecoding.h"

static NSString* const allCharacters = @"0123456789ABCDEF";

@implementation UIColor (hexStringDecoding)

+ (UIColor *)colorWithHexString:(NSString *)string{
    
    NSMutableString* newString = [string mutableCopy];
    if (string.length < 6) {
        for (int i = 0; i < 6 - string.length; i++) {
            [newString appendString:@"F"];
        }
    }
    
    //findRedComponent
    NSString* redHexString = [newString substringWithRange:NSMakeRange(0, 2)];
    NSUInteger redValue = [UIColor getDecValueFromHexString:redHexString];
    
    //findGreenComponent
    NSString* greenHexString = [newString substringWithRange:NSMakeRange(2, 2)];
    NSUInteger greenValue = [UIColor getDecValueFromHexString:greenHexString];
    
    //findBlueComponent
    NSString* blueHexString = [newString substringWithRange:NSMakeRange(4, 2)];
    NSUInteger blueValue = [UIColor getDecValueFromHexString:blueHexString];
    
    UIColor* newColor = [UIColor colorWithRed:(float)redValue/255.f green:(float)greenValue/255.f blue:(float)blueValue/255.f alpha:1.f];
    
    return newColor;
}

+ (BOOL) isValidHexSring:(NSString*) string{
    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:allCharacters];
    
    for (int i = 0; i < string.length; i++) {
        NSString* character = [string substringWithRange:NSMakeRange(i, 1)];
        //input string checking
        if ([character rangeOfCharacterFromSet:set].length != 1) {
            return NO;
        }
    }
    return YES;
}


+ (NSUInteger) getDecValueFromHexString:(NSString *)string
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
