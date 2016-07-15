//
//  MoreInfoVC.m
//  VC-practice
//

#import "MoreInfoVC.h"

@interface MoreInfoVC ()

@end

@implementation MoreInfoVC

- (IBAction)fewInfoTapped:(id)sender
{
    [self.delegate cancelDidTouch:self];
}

@end
