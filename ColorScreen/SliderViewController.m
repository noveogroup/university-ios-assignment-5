//
//  SliderViewController.m
//  ColorScreen
//
//  Created by Vik on 01.03.16.
//  Copyright © 2016 Viktor Erfilov. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()
@property (strong, nonatomic) IBOutlet UILabel *labelRedValue;
@property (strong, nonatomic) IBOutlet UILabel *labelGreenValue;
@property (strong, nonatomic) IBOutlet UILabel *labelBlueValue;

- (IBAction)redSlider:(UISlider *)sender;
- (IBAction)greenSlider:(UISlider *)sender;
- (IBAction)blueSlider:(UISlider *)sender;



@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)redSlider:(UISlider *)sender {
}

- (IBAction)greenSlider:(UISlider *)sender {
}

- (IBAction)blueSlider:(UISlider *)sender {
}
@end
