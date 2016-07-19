
#import <UIKit/UIKit.h>

extern NSString *const HexColorErrorDomain;

typedef NS_ENUM(NSUInteger, HexColorError) {
    HexColorErrorInvalidCharacter,
    HexColorErrorLenghtIsLessThan6,
    HexColorErrorLenghtIsGreaterThan6,
};

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexString error:(NSError *__autoreleasing *)error;

@end
