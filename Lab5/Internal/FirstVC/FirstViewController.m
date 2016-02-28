
#import "FirstViewController.h"

NSString* kFirstStoryboardName = @"first";
NSString* kFirstViewControllerID = @"FirstViewController";

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //set navigation bar number
    NSUInteger VCIndex = [self.navigationController.viewControllers indexOfObject:self] + 1; //first number should be 1
    NSUInteger tabBarSectionIndex = [self.tabBarController selectedIndex] + 1;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld VC's on %ld tab", (unsigned long)VCIndex, (unsigned long)tabBarSectionIndex];
}


#pragma mark - Actions
- (IBAction)showNextVCAction:(id)sender
{
    UIStoryboard* firstStoryboard = [UIStoryboard storyboardWithName:kFirstStoryboardName bundle:nil];
    UINavigationController* nav1 = [firstStoryboard instantiateViewControllerWithIdentifier:kFirstViewControllerID];
    FirstViewController* VC = (FirstViewController*)[nav1 topViewController];
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)sliderAction:(id)sender
{
    UIColor* newColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1.f];
    self.view.backgroundColor = newColor;
}


#pragma mark - UITextFieldDelegate implementation

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location == 0) {
        if ([string isEqualToString:@"#"]) {
            return YES;
        } else {
            return NO;
        }
    }
    if (range.location > 6) {
        if ([string isEqualToString:@"\n"]) {
            if (range.location == 7) {
                [self.setColorTextField resignFirstResponder];
                //set color
                [self setBackgroundColorWithString:self.setColorTextField.text];
                self.setColorTextField.placeholder = self.setColorTextField.text;
                self.setColorTextField.text = @"";

                return NO;
            } else {
                [self.setColorTextField resignFirstResponder];
                //clear text field
                self.setColorTextField.text = @"";
                
                return NO;
            }
        }
        return NO;
    } else {
        if ([string isEqualToString:@""]) {// for deleting
            return YES;
        }
        if ([string isEqualToString:@"\n"]) { //for closing
            [self.setColorTextField resignFirstResponder];
            self.setColorTextField.text = @"";
        }
        //input string checking
        NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEF"];
        if ([string rangeOfCharacterFromSet:set].length == 1) {
            return YES;
        } else {
            return NO;
        }
        
    }
    
    
    return YES;
}

- (void) setBackgroundColorWithString:(NSString*) string
{
    //findRedComponent
    NSString* redHexString = [string substringWithRange:NSMakeRange(1, 2)];
    NSUInteger redValue = [self getDecValueFromHexString:redHexString];

    //findGreenComponent
    NSString* greenHexString = [string substringWithRange:NSMakeRange(3, 2)];
    NSUInteger greenValue = [self getDecValueFromHexString:greenHexString];

    //findBlueComponent
    NSString* blueHexString = [string substringWithRange:NSMakeRange(5, 2)];
    NSUInteger blueValue = [self getDecValueFromHexString:blueHexString];
    
    UIColor* newColor = [UIColor colorWithRed:(float)redValue/255.f green:(float)greenValue/255.f blue:(float)blueValue/255.f alpha:1.f];
    self.view.backgroundColor = newColor;
    
    //move sliders to new values
    self.redSlider.value = (float)redValue/255.f;
    self.greenSlider.value = (float)greenValue/255.f;
    self.blueSlider.value = (float)blueValue/255.f;

}

- (NSUInteger) getDecValueFromHexString:(NSString*) string
{
    if (string.length != 2) {
        return 0;
    } else {
        
        NSUInteger value = 0;
        NSString* allCharacters = @"0123456789ABCDEF";

        for (int i = 0; i < string.length; i++) {
            NSCharacterSet* setWithCharacter = [NSCharacterSet characterSetWithCharactersInString:[string substringWithRange:NSMakeRange(i, 1)]];
            NSUInteger decValue = [allCharacters rangeOfCharacterFromSet:setWithCharacter].location;
            value += decValue * powf(16, string.length - 1 - i);

        }
        
        return value;
    }
}



@end
