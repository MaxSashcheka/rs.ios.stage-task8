//
//  PaletteViewController.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/18/21.
//

#import "PaletteViewController.h"
#import "CustomButton.h"
#import "UIColor+UIColorCategory.h"
#import "ColorPaletteView.h"

@interface PaletteViewController ()

@property (strong,nonatomic) CustomButton* saveButton;

@property (strong,nonatomic) ColorPaletteView* firstCell;
@property (strong,nonatomic) ColorPaletteView* secondCell;
@property (strong,nonatomic) ColorPaletteView* thirdCell;
@property (strong,nonatomic) ColorPaletteView* fourthCell;
@property (strong,nonatomic) ColorPaletteView* fifthCell;
@property (strong,nonatomic) ColorPaletteView* sixCell;
@property (strong,nonatomic) ColorPaletteView* sevenCell;
@property (strong,nonatomic) ColorPaletteView* eightCell;
@property (strong,nonatomic) ColorPaletteView* nineCell;
@property (strong,nonatomic) ColorPaletteView* tenCell;
@property (strong,nonatomic) ColorPaletteView* elevenCell;
@property (strong,nonatomic) ColorPaletteView* twelveCell;

@property (strong,nonatomic) NSMutableArray* colorsArray;

@property (strong,nonatomic) NSTimer *timer;



@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorsArray = [NSMutableArray array];
    [self viewSetup];
    [self otherViewsSetup];
    
    
}

#pragma mark SetupMethods

- (void)viewSetup {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.layer.cornerRadius = 40;
    self.view.layer.shadowRadius = 8;
    self.view.layer.shadowOpacity = 1;
    self.view.layer.shadowOffset = CGSizeMake(0, 0);
    self.view.layer.shadowColor = [[UIColor buttonShadowColor] CGColor];
}

- (void)otherViewsSetup {
    
    // Save button
    self.saveButton = [[CustomButton alloc] init];
    self.saveButton.frame = CGRectMake(250, 20, 85, 32);
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton addTarget:self
                        action:@selector(saveData)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: self.saveButton];
    
    // Color view cells
    self.firstCell = [[ColorPaletteView alloc] init];
    self.firstCell.frame = CGRectMake(17, 92, 40, 40);
    UIView* firstCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    firstCellContentColor.backgroundColor = [UIColor firstPaletteColor];
    firstCellContentColor.layer.cornerRadius = 6;
    [self.firstCell addSubview:firstCellContentColor];
    [self.view addSubview:self.firstCell];
    UIGestureRecognizer* tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstCellTapped)];
    [self.firstCell addGestureRecognizer:tapGesture1];
    
//    self.firstCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
//    self.firstCell.subviews[0].layer.cornerRadius = 8;
    
    self.secondCell = [[ColorPaletteView alloc] init];
    self.secondCell.frame = CGRectMake(77, 92, 40, 40);
    UIView* secondCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    secondCellContentColor.backgroundColor = [UIColor secondPaletteColor];
    secondCellContentColor.layer.cornerRadius = 6;
    [self.secondCell addSubview:secondCellContentColor];
    [self.view addSubview:self.secondCell];
    UIGestureRecognizer* tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(secondCellTapped)];
    [self.secondCell addGestureRecognizer:tapGesture2];
    
    self.thirdCell = [[ColorPaletteView alloc] init];
    self.thirdCell.frame = CGRectMake(137, 92, 40, 40);
    UIView* thirdCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    thirdCellContentColor.backgroundColor = [UIColor thirdPaletteColor];
    thirdCellContentColor.layer.cornerRadius = 6;
    [self.thirdCell addSubview:thirdCellContentColor];
    [self.view addSubview:self.thirdCell];
    UIGestureRecognizer* tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thirdCellTapped)];
    [self.thirdCell addGestureRecognizer:tapGesture3];
    
    self.fourthCell = [[ColorPaletteView alloc] init];
    self.fourthCell.frame = CGRectMake(197, 92, 40, 40);
    UIView* fourthCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    fourthCellContentColor.backgroundColor = [UIColor fourthPaletteColor];
    fourthCellContentColor.layer.cornerRadius = 6;
    [self.fourthCell addSubview:fourthCellContentColor];
    [self.view addSubview:self.fourthCell];
    UIGestureRecognizer* tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fourthCellTapped)];
    [self.fourthCell addGestureRecognizer:tapGesture4];
    
    self.fifthCell = [[ColorPaletteView alloc] init];
    self.fifthCell.frame = CGRectMake(257, 92, 40, 40);
    UIView* fifthCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    fifthCellContentColor.backgroundColor = [UIColor fifthPaletteColor];
    fifthCellContentColor.layer.cornerRadius = 6;
    [self.fifthCell addSubview:fifthCellContentColor];
    [self.view addSubview:self.fifthCell];
    UIGestureRecognizer* tapGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fifthCellTapped)];
    [self.fifthCell addGestureRecognizer:tapGesture5];
    
    self.sixCell = [[ColorPaletteView alloc] init];
    self.sixCell.frame = CGRectMake(317, 92, 40, 40);
    UIView* sixCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    sixCellContentColor.backgroundColor = [UIColor sixPaletteColor];
    sixCellContentColor.layer.cornerRadius = 6;
    [self.sixCell addSubview:sixCellContentColor];
    [self.view addSubview:self.sixCell];
    UIGestureRecognizer* tapGesture6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sixCellTapped)];
    [self.sixCell addGestureRecognizer:tapGesture6];
    
    self.sevenCell = [[ColorPaletteView alloc] init];
    self.sevenCell.frame = CGRectMake(17, 152, 40, 40);
    UIView* sevenCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    sevenCellContentColor.backgroundColor = [UIColor sevenPaletteColor];
    sevenCellContentColor.layer.cornerRadius = 6;
    [self.sevenCell addSubview:sevenCellContentColor];
    [self.view addSubview:self.sevenCell];
    UIGestureRecognizer* tapGesture7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sevenCellTapped)];
    [self.sevenCell addGestureRecognizer:tapGesture7];
    
    self.eightCell = [[ColorPaletteView alloc] init];
    self.eightCell.frame = CGRectMake(77, 152, 40, 40);
    UIView* eightCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    eightCellContentColor.backgroundColor = [UIColor eightPaletteColor];
    eightCellContentColor.layer.cornerRadius = 6;
    [self.eightCell addSubview:eightCellContentColor];
    [self.view addSubview:self.eightCell];
    UIGestureRecognizer* tapGesture8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eightCellTapped)];
    [self.eightCell addGestureRecognizer:tapGesture8];
    
    self.nineCell = [[ColorPaletteView alloc] init];
    self.nineCell.frame = CGRectMake(137, 152, 40, 40);
    UIView* nineCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    nineCellContentColor.backgroundColor = [UIColor ninePaletteColor];
    nineCellContentColor.layer.cornerRadius = 6;
    [self.nineCell addSubview:nineCellContentColor];
    [self.view addSubview:self.nineCell];
    UIGestureRecognizer* tapGesture9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nineCellTapped)];
    [self.nineCell addGestureRecognizer:tapGesture9];
    
    self.tenCell = [[ColorPaletteView alloc] init];
    self.tenCell.frame = CGRectMake(197, 152, 40, 40);
    UIView* tenCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    tenCellContentColor.backgroundColor = [UIColor tenPaletteColor];
    tenCellContentColor.layer.cornerRadius = 6;
    [self.tenCell addSubview:tenCellContentColor];
    [self.view addSubview:self.tenCell];
    UIGestureRecognizer* tapGesture10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tenCellTapped)];
    [self.tenCell addGestureRecognizer:tapGesture10];
    
    self.elevenCell = [[ColorPaletteView alloc] init];
    self.elevenCell.frame = CGRectMake(257, 152, 40, 40);
    UIView* elevenCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    elevenCellContentColor.backgroundColor = [UIColor elevenPaletteColor];
    elevenCellContentColor.layer.cornerRadius = 6;
    [self.elevenCell addSubview:elevenCellContentColor];
    [self.view addSubview:self.elevenCell];
    UIGestureRecognizer* tapGesture11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(elevenCellTapped)];
    [self.elevenCell addGestureRecognizer:tapGesture11];
    
    self.twelveCell = [[ColorPaletteView alloc] init];
    self.twelveCell.frame = CGRectMake(317, 152, 40, 40);
    UIView* twelveCellContentColor = [[UIView alloc] initWithFrame: CGRectMake(8, 8, 24, 24)];
    twelveCellContentColor.backgroundColor = [UIColor twelvePaletteColor];
    twelveCellContentColor.layer.cornerRadius = 6;
    [self.twelveCell addSubview:twelveCellContentColor];
    [self.view addSubview:self.twelveCell];
    UIGestureRecognizer* tapGesture12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twelveCellTapped)];
    [self.twelveCell addGestureRecognizer:tapGesture12];

    
    
}

#pragma mark WorkingMethods


- (void) saveData {
    
    NSUInteger arrayCount = self.colorsArray.count;
    if (arrayCount < 3) {
        for (int i = 0; i < 3 - arrayCount; i++) {
            [self.colorsArray insertObject:[UIColor blackColor] atIndex:self.colorsArray.count];
        }
    }
    
    for (int i = 0; i < self.colorsArray.count; i++) {
        NSLog(@"%@",[self.colorsArray[i] description]);
    }
    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
}



- (void)firstCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor firstPaletteColor]];

    if (self.firstCell.subviews[0].layer.cornerRadius == 8) {
        self.firstCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.firstCell.subviews[0].layer.cornerRadius = 6;
    } else {
        self.view.backgroundColor = [UIColor firstPaletteColor];
        self.firstCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.firstCell.subviews[0].layer.cornerRadius = 8;

        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(firstCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
    
}

- (void)secondCellTapped {
    [self updateColorsArrayWithNewColor: [UIColor secondPaletteColor]];

    if (self.secondCell.subviews[0].layer.cornerRadius == 8) {
        self.secondCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.secondCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor secondPaletteColor];
        self.secondCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.secondCell.subviews[0].layer.cornerRadius = 8;
        
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(secondCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)thirdCellTapped {
    [self updateColorsArrayWithNewColor: [UIColor thirdPaletteColor]];

    
    if (self.thirdCell.subviews[0].layer.cornerRadius == 8) {
        self.thirdCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.thirdCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor thirdPaletteColor];
        self.thirdCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.thirdCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(thirdCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)fourthCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor fourthPaletteColor]];

    if (self.fourthCell.subviews[0].layer.cornerRadius == 8) {
        self.fourthCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.fourthCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor fourthPaletteColor];
        self.fourthCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.fourthCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(fourthCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)fifthCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor fifthPaletteColor]];

    if (self.fifthCell.subviews[0].layer.cornerRadius == 8) {
        self.fifthCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.fifthCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor fifthPaletteColor];
        self.fifthCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.fifthCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(fifthCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)sixCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor sixPaletteColor]];

    if (self.sixCell.subviews[0].layer.cornerRadius == 8) {
        self.sixCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.sixCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor sixPaletteColor];
        self.sixCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.sixCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(sixCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    };
}

- (void)sevenCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor sevenPaletteColor]];

    if (self.sevenCell.subviews[0].layer.cornerRadius == 8) {
        self.sevenCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.sevenCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor sevenPaletteColor];
        self.sevenCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.sevenCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(sevenCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)eightCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor eightPaletteColor]];

    if (self.eightCell.subviews[0].layer.cornerRadius == 8) {
        self.eightCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.eightCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor eightPaletteColor];
        self.eightCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.eightCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(eightCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)nineCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor ninePaletteColor]];

    if (self.nineCell.subviews[0].layer.cornerRadius == 8) {
        self.nineCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.nineCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor ninePaletteColor];
        self.nineCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.nineCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(nineCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)tenCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor tenPaletteColor]];

    if (self.tenCell.subviews[0].layer.cornerRadius == 8) {
        self.tenCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.tenCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor tenPaletteColor];
        self.tenCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.tenCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(tenCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)elevenCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor elevenPaletteColor]];

    if (self.elevenCell.subviews[0].layer.cornerRadius == 8) {
        self.elevenCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.elevenCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor elevenPaletteColor];
        self.elevenCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.elevenCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(elevenCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)twelveCellTapped {
    
    [self updateColorsArrayWithNewColor: [UIColor twelvePaletteColor]];

    if (self.twelveCell.subviews[0].layer.cornerRadius == 8) {
        self.twelveCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
        self.twelveCell.subviews[0].layer.cornerRadius = 6;
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor twelvePaletteColor];
        self.twelveCell.subviews[0].frame = CGRectMake(2, 2, 36, 36);
        self.twelveCell.subviews[0].layer.cornerRadius = 8;
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(twelveCellSetDefault)
                                                    userInfo:nil
                                                     repeats:NO];
    }
}

- (void)firstCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.firstCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.firstCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)secondCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.secondCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.secondCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)thirdCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.thirdCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.thirdCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)fourthCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.fourthCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.fourthCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)fifthCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.fifthCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.fifthCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)sixCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.sixCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.sixCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)sevenCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.sevenCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.sevenCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)eightCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.eightCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.eightCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)nineCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.nineCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.nineCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)tenCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tenCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.tenCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)elevenCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.elevenCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.elevenCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)twelveCellSetDefault {
    self.view.backgroundColor = [UIColor whiteColor];
    self.twelveCell.subviews[0].frame = CGRectMake(8, 8, 24, 24);
    self.twelveCell.subviews[0].layer.cornerRadius = 6;
    
}

- (void)updateColorsArrayWithNewColor: (UIColor*) newColor {
    
//    for (int i = 0; i < self.colorsArray; i++) {
//        if ([[newColor description] isEqualToString:[self.colorsArray[i] description]]) {
//            [self.colorsArray[i] removeObjectAtIndex:i];
//        }
//    }
    
    if (self.colorsArray.count == 3) {
        [self.colorsArray insertObject:newColor atIndex:0];
        [self.colorsArray removeObjectAtIndex:1];
    } else {
        [self.colorsArray insertObject:newColor atIndex:self.colorsArray.count];
        
    }
}



@end
