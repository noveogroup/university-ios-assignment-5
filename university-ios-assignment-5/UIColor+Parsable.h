#import <Foundation/Foundation.h>

@interface UIColor (Parsable)

+ (NSString *)RGBStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue
        fromHEXString:(NSString *)string;
+ (UIColor *)getColorByHEXString:(NSString *)string;

@end