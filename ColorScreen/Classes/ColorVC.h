

#import <UIKit/UIKit.h>

@interface ColorVC : UIViewController

@property (strong, nonatomic) UIColor *color;


- (instancetype)initWithLevel:(NSInteger)level;

- (void)redSliderChanged:(UISlider *)sender;
- (void)greenSliderChanged:(UISlider *)sender;
- (void)blueSliderChanged:(UISlider *)sender;
- (void)updateSliderValueWithColor:(UIColor *)color;
- (void)updateBackgroundColor;

@end
