
#import <UIKit/UIKit.h>

@interface UIColor (hexStringDecoding)

+ (UIColor *)colorWithHexString:(NSString *)string;

- (NSString*)hexString;

@end
