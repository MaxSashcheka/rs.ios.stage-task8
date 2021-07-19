//
//  MainScreenViewController.h
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/17/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MainScreenConditions) {
    Idle,
    Draw,
    Done
} ;

@interface MainScreenViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
