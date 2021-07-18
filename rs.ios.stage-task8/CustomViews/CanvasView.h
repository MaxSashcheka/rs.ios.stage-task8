//
//  CanvasView.h
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/17/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

@property (assign,nonatomic) NSUInteger currentCanvasIdentifier;
@property (strong,nonatomic) NSMutableArray* colorsArray;
@property (assign,nonatomic) BOOL isFirstDraw;

@end

NS_ASSUME_NONNULL_END
