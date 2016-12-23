
#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshScreen];//инициализируем нулями
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

@end
