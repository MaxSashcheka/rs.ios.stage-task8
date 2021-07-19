//
//  CustomButton.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/17/21.
//

#import "CustomButton.h"
#import "UIColor+UIColorCategory.h"

@implementation CustomButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Init is called");
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor lightGreenSea] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
        self.layer.shadowColor = [[UIColor buttonShadowColor] CGColor];
        self.layer.shadowRadius = 2;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 1;
//        self.contentEdgeInsets = UIEdgeInsetsMake(5, 21, 5, 21);
        self.layer.cornerRadius = 8;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    NSLog(@"%@",self.layer.shadowColor);
    NSLog(@"%f",self.layer.shadowRadius);
    NSLog(@"==========================");
    if (highlighted) {
        self.layer.shadowColor = [UIColor lightGreenSea].CGColor;
        self.layer.shadowRadius = 4;
    } else {
        self.layer.shadowColor = [UIColor buttonShadowColor].CGColor;
        self.layer.shadowRadius = 2;
    }
    NSLog(@"%@",self.layer.shadowColor);
    NSLog(@"%f",self.layer.shadowRadius);
}

- (void)setToHiglightedState {
    
    self.layer.shadowColor = [[UIColor lightGreenSea] CGColor];

    self.layer.shadowColor = [[UIColor redColor] CGColor];


    self.layer.shadowRadius = 4;
    NSLog(@"called");
}

- (void)setToDefaultState {
    self.layer.shadowColor = [[UIColor buttonShadowColor] CGColor];
    self.layer.shadowRadius = 2;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        self.alpha = 1;
    } else {
        self.alpha = 0.25;
    }
}

- (void)dealloc
{
    NSLog(@"button dealloc");
}


@end

