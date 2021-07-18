//
//  TimerViewController.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/18/21.
//

#import "TimerViewController.h"
#import "CustomButton.h"
#import "UIColor+UIColorCategory.h"

@interface TimerViewController ()

@property (strong,nonatomic) CustomButton* saveButton;

@property (strong,nonatomic) UILabel *oneNumberLabel;
@property (strong,nonatomic) UILabel *fiveNumberLabel;
@property (strong,nonatomic) UILabel *timerLabel;

@property (strong,nonatomic) UISlider *timerSlider;



@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self viewSetup];
    [self otherViewsSetup];
}

- (void)viewSetup {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.layer.cornerRadius = 40;
    self.view.layer.shadowRadius = 8;
    self.view.layer.shadowOpacity = 1;
    self.view.layer.shadowOffset = CGSizeMake(0, 0);
    self.view.layer.shadowColor = [[UIColor buttonShadowColor] CGColor];
}

- (void)otherViewsSetup {
    
    // SaveButton
    self.saveButton = [[CustomButton alloc] init];
    self.saveButton.frame = CGRectMake(250, 20, 85, 32);
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton addTarget:self
                        action:@selector(saveData)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.saveButton];
    
    // Slider
    self.timerSlider = [[UISlider alloc] initWithFrame: CGRectMake(74, 112, 223, 4)];
    self.timerSlider.tintColor = [UIColor lightGreenSea];
    self.timerSlider.minimumValue = 1;
    self.timerSlider.maximumValue = 5;
    [self.timerSlider addTarget:self action:@selector(updatetimerLabel) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.timerSlider];
    
    // Labels
    self.oneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, 103, 7, 22)];
    self.oneNumberLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.oneNumberLabel.text = @"1";
    [self.view addSubview:self.oneNumberLabel];
    
    self.fiveNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(338, 103, 11, 22)];
    self.fiveNumberLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.fiveNumberLabel.text = @"5";
    [self.view addSubview:self.fiveNumberLabel];
    
    self.timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(162, 161, 52, 22)];
    self.timerLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.timerLabel.text = [NSString stringWithFormat: @"%.02f", self.timerSlider.value];
    [self.view addSubview:self.timerLabel];
    
    
}

- (void)updatetimerLabel {
    self.timerLabel.text = [NSString stringWithFormat: @"%.02f", self.timerSlider.value];

}



- (void) saveData {
    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
}

@end
