//
//  ColorPaletteView.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/18/21.
//

#import "ColorPaletteView.h"
#import "UIColor+UIColorCategory.h"

@implementation ColorPaletteView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius = 10;
        self.layer.shadowRadius = 2;
        self.layer.shadowOpacity = 1;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowColor = [[UIColor buttonShadowColor] CGColor];
    }
    return self;
}

@end
