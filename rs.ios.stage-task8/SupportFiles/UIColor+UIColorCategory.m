//
//  UIColor+UIColorCategory.m
//  RSSchool_T8
//
//  Created by Max Sashcheka on 7/17/21.
//

#import "UIColor+UIColorCategory.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                alpha:1.0]

@implementation UIColor (UIColorCategory)

+ (UIColor*)firstPaletteColor {
    return UIColorFromRGB(0xE21B2C);
}

+ (UIColor*)secondPaletteColor {
    return UIColorFromRGB(0x3E17CC);
}

+ (UIColor*)thirdPaletteColor {
    return UIColorFromRGB(0x007C37);
}

+ (UIColor*)fourthPaletteColor {
    return UIColorFromRGB(0x808080);
}

+ (UIColor*)fifthPaletteColor {
    return UIColorFromRGB(0x9D5EEA);
}

+ (UIColor*)sixPaletteColor {
    return UIColorFromRGB(0xFF7A68);
}

+ (UIColor*)sevenPaletteColor {
    return UIColorFromRGB(0xFFAD54);
}

+ (UIColor*)eightPaletteColor {
    return UIColorFromRGB(0x00AEED);
}

+ (UIColor*)ninePaletteColor {
    return UIColorFromRGB(0xFF77A2);
}

+ (UIColor*)tenPaletteColor {
    return UIColorFromRGB(0x002E3C);
}

+ (UIColor*)elevenPaletteColor {
    return UIColorFromRGB(0x0E3718);
}

+ (UIColor*)twelvePaletteColor {
    return UIColorFromRGB(0x610F10);
}

+ (UIColor*)lightGreenSea {
    return UIColorFromRGB(0x21B08E);
}

+ (UIColor*)chillSky {
    return UIColorFromRGB(0x00B2FF);
}

+ (UIColor*)canvasShadowColor {
    return [UIColor colorWithRed:0 green:179 blue:255 alpha:0.25];
}

+ (UIColor*)buttonShadowColor {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
}

@end
