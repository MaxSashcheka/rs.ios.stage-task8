//
//  UIButton+Highlighted.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/18/21.
//

#import "UIButton+Highlighted.h"
#import "UIColor+UIColorCategory.h"

@implementation UIButton (Highlighted)

- (void)initialSetup {
    self.layer.cornerRadius = 10;
    
    self.backgroundColor = [UIColor whiteColor];
    [self setTitleColor:[UIColor lightGreenSea] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.layer.shadowColor = [[UIColor buttonShadowColor] CGColor];
    self.layer.shadowRadius = 2;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 1;
}

- (void) setToHighlitedState {
    self.layer.shadowColor = [UIColor lightGreenSea].CGColor;
    self.layer.shadowRadius = 4;
}

- (void) setToDefaultState {
    self.layer.shadowColor = [UIColor buttonShadowColor].CGColor;
    self.layer.shadowRadius = 2;
}



@end
