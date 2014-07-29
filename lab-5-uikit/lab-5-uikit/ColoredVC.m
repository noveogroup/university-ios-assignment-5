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
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@end


@implementation ColoredVC

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix andDepth:(unsigned int)depth {
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    
    _depth = depth;
    _titlePrefix = [NSString stringWithString:titlePrefix];

    return self;
}

- (instancetype)initWithTitlePrefix:(NSString *)titlePrefix {
    self = [self initWithTitlePrefix:titlePrefix andDepth:0];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:[NSString stringWithFormat:@"%@ %i", self.titlePrefix, self.depth]];
    
}

- (IBAction)nextButtonTap:(UIButton *)sender {
    ColoredVC *nextScreenVC = [[ColoredVC alloc] initWithTitlePrefix:self.titlePrefix andDepth:(self.depth+1)];
    [self.navigationController pushViewController:nextScreenVC animated:YES];
}

@end
