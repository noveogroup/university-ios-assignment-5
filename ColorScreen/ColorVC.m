

#import "ColorVC.h"

@interface ColorVC ()
@property (assign, nonatomic) NSInteger count;

@end

@implementation ColorVC



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.count = 1;
    }
    return self;
}

- (instancetype)initWithLevel:(NSInteger)level
{
    self = [self init];
    
    if (self) {
        self.count = level;
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
 
    [self addNextButton];
    
    
    


}

#pragma mark - Methods

- (void)goNextViewControllerFrom:(UIButton *)sender {
    NSLog(@"goNextViewControllerFrom");
    NSInteger level = self.count + 1;
    ColorVC *nextColorVC = [[ColorVC alloc] initWithLevel:level];
    
    nextColorVC.title = [NSString stringWithFormat:@"ColorVC level: %ld", level];
    nextColorVC.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                                    style:UIBarButtonItemStylePlain
                                                                                   target:self
                                                                                   action:nil];
    
    [self.navigationController pushViewController:nextColorVC animated:YES];
}

- (void)addNextButton {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self
               action:@selector(goNextViewControllerFrom:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];

    
    
    
    button.backgroundColor = [UIColor blackColor];
    
    CGSize buttonSize = CGSizeMake(160, 40);
    
    button.frame = CGRectMake(CGRectGetMidX(self.view.frame) - buttonSize.width / 2,
                              CGRectGetMaxY(self.view.frame) - 120,
                              buttonSize.width,
                              buttonSize.height);
    
    button.layer.cornerRadius = 5.f;
    button.layer.borderColor = [[UIColor whiteColor] CGColor];
    button.layer.borderWidth = 1.f;
    [self.view addSubview:button];
}




@end
