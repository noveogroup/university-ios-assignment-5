

#import <UIKit/UIKit.h>

@interface UIColor (HexColors)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (NSString *)hexValuesFromUIColor:(UIColor *)color;

@end
