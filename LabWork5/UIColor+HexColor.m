
#import "UIColor+HexColor.h"

NSString *const HexColorErrorDomain = @"com.librecht.LabWork5.HexColorErrorDomain";

@implementation UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexString error:(NSError *__autoreleasing *)error
{
    NSRange nonHexRange = [hexString rangeOfCharacterFromSet:[[NSCharacterSet characterSetWithCharactersInString: @"0123456789ABCDEFabcdef"] invertedSet]];
    BOOL isHex = (nonHexRange.location == NSNotFound);
    
    if (!isHex) {
        
        *error = [NSError errorWithDomain:HexColorErrorDomain
                                     code:HexColorErrorLenghtIsGreaterThan6
                                 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Hex code contain illegal characters", nil)}];
        return nil;
    }
    
    if (hexString.length < 6) {
        
        *error = [NSError errorWithDomain:HexColorErrorDomain
                                     code:HexColorErrorLenghtIsLessThan6
                                 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Hex code contain less than 6 characters", nil)}];
        return nil;
    }
    
    if (hexString.length > 6) {
        
        *error = [NSError errorWithDomain:HexColorErrorDomain
                                     code:HexColorErrorLenghtIsGreaterThan6
                                 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Hex code contain more than 6 characters", nil)}];
        return nil;
    }
    
    unsigned int red, green, blue;
    NSScanner* scanner = [NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(0, 2)]];
    [scanner scanHexInt:&red];
    scanner = [NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(2, 2)]];
    [scanner scanHexInt:&green];
    scanner = [NSScanner scannerWithString:[hexString substringWithRange:NSMakeRange(4, 2)]];
    [scanner scanHexInt:&blue];
    
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:1.0];
}

@end

















