#import "UIColor+Parsable.h"


@implementation UIColor (Parsable)

+ (NSString *)RGBStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [NSString stringWithFormat:@"#%02x%02x%02x", (unsigned int) round(red * 255),
                    (unsigned int) round(green * 255), (unsigned int) round(blue * 255)];
}

+ (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue
        fromHEXString:(NSString *)string
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"#[0-9 a-f]{6}"
            options:NSRegularExpressionCaseInsensitive error:&error];

    if (regex != nil) {
        NSUInteger matches = [regex numberOfMatchesInString:string options:0
                range:NSMakeRange(0, [string length])];

        if (matches == 1) {
            unsigned int redHex = 0;
            unsigned int greenHex = 0;
            unsigned int blueHex = 0;

            [[NSScanner scannerWithString:[string substringWithRange:(NSRange) {1, 2}]]
                    scanHexInt:&redHex];
            [[NSScanner scannerWithString:[string substringWithRange:(NSRange) {3, 2}]]
                    scanHexInt:&greenHex];
            [[NSScanner scannerWithString:[string substringWithRange:(NSRange) {5, 2}]]
                    scanHexInt:&blueHex];

            if (red != NULL) {
                *red = (float) redHex / 255;
            }

            if (green != NULL) {
                *green = (float) greenHex / 255;
            }

            if (blue != NULL) {
                *blue = (float) blueHex / 255;
            }

            return YES;
        }
    }

    return NO;
}

+ (UIColor *)getColorByHEXString:(NSString *)string
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;

    if (![UIColor getRed:&red green:&green blue:&blue fromHEXString:string]) {
        return nil;
    }
    else {
        return [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }
}

@end