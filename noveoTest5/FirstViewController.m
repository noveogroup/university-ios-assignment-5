
#import "FirstViewController.h"
#import "UIColor+HexString.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshScreen];//инициализируем нулями
    //self.textField.keyboardAppearance
}

#pragma mark - Private Metods
//когда контроллер загрузится, я хочу инициализировать первоначальное состояние
//поэтому я выношу все в отдельный метод
-(void)refreshScreen {
    
    CGFloat red = self.redComponentSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    self.infoLabel.text = [NSString stringWithFormat:@"{%1.2f, %1.2f, %1.2f}", red, green, blue];
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f]; //генерируем цвет
    
    self.view.backgroundColor = color;//ставим на наш вью как бэкграундкалор

}


#pragma mark - Actions

- (IBAction) actionSlider:(UISlider *)sender {//это первое что делаем, перетягиваем из сториборда слайдер

    //любой сендер который пришел, мы вызываем метод рефреш и
     //self.infoLabel.text = [NSString stringWithFormat:@"%1.2f", sender.value];
     [self refreshScreen];
}

- (IBAction)actionEnabled:(UISwitch *)sender {
    
    self.redComponentSlider.enabled = self.greenComponentSlider.enabled = self.blueComponentSlider.enabled = sender.isOn;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    double delayInSeconds = 1.0f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });

}

@end


// NSLog(@"%0.2f", sender.value);//выведем 2 числа после запятой максимум
//когда меняется валюе, тогда будет вызван наш метод
//когда меняется валью, тогда будем выводить в консоль какие - то значения
//не забывать %

//будем генерировать цвет.Когда мы двигаем один слайдер нам надо генерировтаь цвет на основе всех трех
//если копировать слайдеры то они будут вызывать один и тот же метод акшн
//создаем 3 пропертис на слайдер и все три слайдера по какому-то измению вызывают метод акшн
// нам не важно какой придет, мы будем брать значение, которое придет и на основе них будем создавать цвет

