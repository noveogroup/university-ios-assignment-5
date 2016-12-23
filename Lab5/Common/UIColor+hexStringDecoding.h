
#import <UIKit/UIKit.h>

@interface UIColor (hexStringDecoding)

+ (UIColor *)colorWithHexString:(NSString *)string;

+ (BOOL) isValidHexSring:(NSString*) string;

- (NSString*)hexString;

@end
