//
//  ColoredVC.m
//  lab-5-uikit
//
//  Created by Admin on 29/07/14.
//  Copyright (c) 2014 Noveo Summer Internship. All rights reserved.
//

#import "ColoredVC.h"

@interface ColoredVC ()

@property (nonatomic, copy) NSString *titlePrefix;

@end

@implementation ColoredVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix {
    self = [super init];
    
    _depth = 0;
    _titlePrefix = [NSString stringWithString:titlePrefix];

    return self;
}

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix andDepth:(unsigned int)depth {
    self = [super init];
    
    _depth = depth;
    _titlePrefix = [NSString stringWithString:titlePrefix];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:[NSString stringWithFormat:@"%@ %i", self.titlePrefix, self.depth]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButtonTap:(UIButton *)sender {
    ColoredVC *nextScreenVC = [[ColoredVC alloc] initWithTitlePrefix:self.titlePrefix andDepth:(self.depth+1)];
    [self.navigationController pushViewController:nextScreenVC animated:YES];
}

@end
