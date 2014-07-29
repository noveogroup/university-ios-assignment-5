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

// 0 - Red, 1 - Green, 2 - Blue
@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *colorSliders;

@end


@implementation ColoredVC

CGFloat colorValues[3];

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
    
    for (UISlider *slider in self.colorSliders) {
        [self colorValueChanged:slider];
    }
    
}

- (IBAction)nextButtonTap:(UIButton *)sender {
    ColoredVC *nextScreenVC = [[ColoredVC alloc]
        initWithTitlePrefix:self.titlePrefix andDepth:(self.depth+1)];
    
    [self.navigationController pushViewController:nextScreenVC animated:YES];
}

- (IBAction)colorValueChanged:(UISlider *)sender {
    int colorIndex = [self.colorSliders indexOfObject:sender];
    
    colorValues[colorIndex] = sender.value;
    
    self.view.backgroundColor = [UIColor
        colorWithRed:colorValues[0]
        green:colorValues[1]
        blue:colorValues[2]
        alpha:1
    ];
}

@end
