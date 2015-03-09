

#import "InformationVC.h"

const CGFloat INDENT = 30;
const CGFloat HEIGHT = 30;

@interface InformationVC ()

@property (nonatomic) UILabel *nameTitle;
@property (nonatomic) UIButton *versionButton;
@property (nonatomic) UIButton *aboutButton;

@end

@implementation InformationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [[UIColor alloc]initWithWhite:1 alpha:1];
    self.nameTitle = [[UILabel alloc]init];
    self.nameTitle.text = @"LabWork 5";
    self.nameTitle.textAlignment = NSTextAlignmentCenter;
    
    self.versionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.versionButton setTitle:@"Version" forState:UIControlStateNormal];
    [self.versionButton addTarget:self action:@selector(versionButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    self.aboutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.aboutButton setTitle:@"About author" forState:UIControlStateNormal];
    [self.aboutButton addTarget:self action:@selector(aboutButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nameTitle];
    [self.view addSubview:self.versionButton];
    [self.view addSubview:self.aboutButton];
    
    self.nameTitle.frame = CGRectMake(0, INDENT, self.view.bounds.size.width, HEIGHT);
    self.nameTitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    self.versionButton.frame = CGRectMake(0, 0, self.view.bounds.size.width/2, HEIGHT);
    self.versionButton.center = CGPointMake(self.view.center.x, (self.nameTitle.center.y + INDENT));
    self.versionButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    self.aboutButton.frame = CGRectMake(0, 0, self.view.bounds.size.width/2, HEIGHT);
    self.aboutButton.center = CGPointMake(self.view.center.x, (self.versionButton.center.y + INDENT));
    self.aboutButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
}

- (void)versionButtonTapped
{
    NSString *version = @"Version 1.0";
    UIAlertView *versionInfo = [[UIAlertView alloc]initWithTitle:@"Version Information" message:version delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [versionInfo show];
}

- (void)aboutButtonTapped
{
    
}

@end
