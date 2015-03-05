//
//  ViewController.m
//  UIKitApplication
//
//  Created by Иван Букшев on 3/3/15.
//  Copyright (c) 2015 Ivan Bukshev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *description;
@property (strong, nonatomic) UIButton *dismissButton;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Set start background color.
    self.view.backgroundColor = [UIColor colorWithRed:153.f/255.f
                                                green:102.f/255.f
                                                 blue:255.f/255.f
                                                alpha:1.f];
    
    // Set my name and surname to label.
    self.name = [[UILabel alloc] init];
    [self.name setText:@"Ivan Bukshev"];
    self.name.textAlignment = NSTextAlignmentCenter;
    [self.name setFont:[UIFont boldSystemFontOfSize:25.f]];
    
    // Set scroll view under my name label.
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    // Create label with info, which will loated in scroll view.
    self.description = [[UILabel alloc] init];
    self.description.text = @"Full name: Ivan Bukshev\n\nAge: 19\nCity: Novosibirsk\nUniversity: NSU\nDepartment: IT\nGroup: 12203";
    //self.description.lineBreakMode = UILineBreakModeCharacterWrap;
    self.description.numberOfLines = 0;
    self.description.textAlignment = NSTextAlignmentCenter;
    [self.description sizeToFit];

    // Set size of scroll view and add description label.
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, self.description.frame.size.height);
    
    // Set button properties.
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.dismissButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.dismissButton addTarget:self.delegate
                           action:@selector(infoViewFinished:)
                 forControlEvents:UIControlEventTouchUpInside];
    
    // Set elements to parent view(s). 
    [self.scrollView addSubview:self.description];
    [self.view addSubview:self.name];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.dismissButton];
    
    [self adjustForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}		

- (void)adjustForOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIColor *colorBG = [UIColor colorWithRed:51.f/255.f
                                       green:51.f/255.f
                                        blue:102.f/255.f
                                       alpha:1.f];
    
    // Set backgroung color to each view and set text color.
    self.name.backgroundColor = colorBG;
    self.scrollView.backgroundColor = colorBG;
    self.description.backgroundColor = colorBG;
    self.name.textColor = [UIColor whiteColor];
    self.description.textColor = [UIColor whiteColor];
    
    // Set coords acording to orientation.
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation))
    {
        self.name.frame = CGRectMake(0, 0, screenRect.size.height, 100);
        self.scrollView.frame = CGRectMake(0, 110, screenRect.size.height, screenRect.size.width-110);
        self.dismissButton.frame = CGRectMake(0, 220, (screenRect.size.width/2), 50);
        
        self.description.center = [self.scrollView convertPoint:self.scrollView.center fromView:self.scrollView.superview];
        self.dismissButton.center = [self.scrollView convertPoint:self.scrollView.center fromView:self.scrollView.superview];
    }
    else
    {
        self.name.frame = CGRectMake(0, 0, screenRect.size.width, 100);
        self.scrollView.frame = CGRectMake(0, 110, screenRect.size.width, screenRect.size.height-270);
        self.dismissButton.frame = CGRectMake(20, 320, (screenRect.size.width/2), 50);

        
        self.description.center = [self.scrollView convertPoint:self.scrollView.center fromView:self.scrollView.superview];
        self.dismissButton.center = [self.scrollView convertPoint:self.scrollView.center fromView:self.scrollView.superview];
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    [self adjustForOrientation:toInterfaceOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
