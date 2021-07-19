//
//  MainScreenViewController.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/17/21.
//

#import "MainScreenViewController.h"
#import "DrawingsScreenViewController.h"
#import "PaletteViewController.h"
#import "TimerViewController.h"

#import "CustomButton.h"
#import "CanvasView.h"
#import "UIColor+UIColorCategory.h"

@interface MainScreenViewController ()

@property (strong,nonatomic) CustomButton *openPaletteButton;
@property (strong,nonatomic) CustomButton *openTimerButton;
@property (strong,nonatomic) CustomButton *drawButton;
@property (strong,nonatomic) CustomButton *shareButton;

@property (strong,nonatomic) CanvasView *canvasView;

@property (strong,nonatomic) DrawingsScreenViewController *drawingVC;

@property (strong,nonatomic) PaletteViewController *paletteVC;
@property (strong,nonatomic) TimerViewController *timerVC;

@property (assign,nonatomic) MainScreenConditions screenCurrentCondition;



@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenCurrentCondition = Idle;
    

    [self initializeViews];
    [self navigationControllerSetup];
    [self buttonActionsSetup];
    [self setIdleCondition];
    
}

#pragma mark Initializing and setup

- (void)buttonActionsSetup {
    [self.openPaletteButton addTarget:self
                             action:@selector(openPalleteChildVC)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.openTimerButton addTarget:self
                             action:@selector(openTimerChildVC)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.drawButton addTarget:self
                             action:@selector(startDraw)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.shareButton addTarget:self
                             action:@selector(share)
                   forControlEvents:UIControlEventTouchUpInside];
}



- (void)initializeViews {
    
    //View controllers
    self.drawingVC = [[DrawingsScreenViewController alloc] init];
    self.paletteVC = [[PaletteViewController alloc] init];
    self.timerVC = [[TimerViewController alloc] init];
    
    //CanvasView
    self.canvasView = [[CanvasView alloc] init];
    self.canvasView.frame = CGRectMake(38, 104, 300, 300);
    self.drawingVC.canvasView = self.canvasView;
    self.timerVC.canvasView = self.canvasView;
    
    [self.view addSubview: self.canvasView];

    //Buttons
    self.openPaletteButton = [[CustomButton alloc] init];
    self.openPaletteButton.frame = CGRectMake(20, 454, 163, 32);
    [self.openPaletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
    [self.view addSubview: self.openPaletteButton];
    
    self.drawButton = [[CustomButton alloc] init];
    self.drawButton.frame = CGRectMake(243, 454, 91, 32);
    [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    [self.view addSubview: self.drawButton];
    
    self.openTimerButton = [[CustomButton alloc] init];
    self.openTimerButton.frame = CGRectMake(20, 506, 151, 32);
    [self.openTimerButton setTitle:@"Open Timer" forState:UIControlStateNormal];
    [self.view addSubview: self.openTimerButton];
    
    self.shareButton = [[CustomButton alloc] init];
    self.shareButton.frame = CGRectMake(239, 506, 95, 32);
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [self.view addSubview: self.shareButton];

}

- (void)navigationControllerSetup {
    self.navigationController.title = @"Artist";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                      style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(goToDrawingVC)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor lightGreenSea];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size: 17]} forState:UIControlStateNormal];
    
    
}

#pragma mark Draw

- (void)startDraw {
    [self setDoneCondition];
    self.canvasView.isFirstDraw = NO;
    [self.canvasView setNeedsDisplay];
}


#pragma mark Share

- (void)share {
    CGRect boundsRect = [self.canvasView bounds];
    UIGraphicsBeginImageContext(boundsRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.canvasView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[image];
    
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    activityViewControntroller.popoverPresentationController.sourceView = self.view;
    activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}

#pragma mark ChildVC setup and open

- (void)openPalleteChildVC {
    
    self.paletteVC = [[PaletteViewController alloc] init];
    [self addChildViewController:self.paletteVC];
    self.paletteVC.view.frame = [self frameOfChildVC];;
    
    [self.view addSubview:self.paletteVC.view];
    [self.paletteVC didMoveToParentViewController:self];
    
}

- (void)openTimerChildVC {
    
    self.timerVC = [[TimerViewController alloc] init];
    [self addChildViewController:self.timerVC];
    self.timerVC.view.frame = [self frameOfChildVC];;
    
    [self.view addSubview:self.timerVC.view];
    [self.timerVC didMoveToParentViewController:self];
    
}

- (CGRect)frameOfChildVC {
    return CGRectMake(0,
                      self.view.frame.size.height / 2,
                      self.view.frame.size.width,
                      self.view.frame.size.height / 2 + 40);
}


- (void)goToDrawingVC {
    [self.navigationController pushViewController:self.drawingVC animated:YES];
}




#pragma mark Conditions
- (void)setIdleCondition {
    [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];

    [self.drawButton setEnabled:YES];
    [self.shareButton setEnabled:NO];
    
    [self.openPaletteButton setEnabled:YES];
    [self.openTimerButton setEnabled:YES];
    
}

- (void)setDrawCondition {
    
    [self.drawButton setEnabled:NO];
    [self.shareButton setEnabled:NO];
    
    [self.openPaletteButton setEnabled:NO];
    [self.openTimerButton setEnabled:NO];
    
}

- (void)setDoneCondition {
    [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];

    [self.drawButton setEnabled:YES];
    [self.shareButton setEnabled:YES];
    
    [self.openPaletteButton setEnabled:NO];
    [self.openTimerButton setEnabled:NO];
    
}

@end
