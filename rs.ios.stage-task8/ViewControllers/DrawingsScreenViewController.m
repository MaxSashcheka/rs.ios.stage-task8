//
//  DrawingsScreenViewController.m
//  rs.ios.stage-task8
//
//  Created by Max Sashcheka on 7/17/21.
//

#import "DrawingsScreenViewController.h"
#import "CustomButton.h"
#import "UIColor+UIColorCategory.h"
#import "CanvasView.h"
#import "UIButton+Highlighted.h"

@interface DrawingsScreenViewController ()

@property (strong,nonatomic) UIButton *planetButton;
@property (strong,nonatomic) UIButton *headButton;
@property (strong,nonatomic) UIButton *treeButton;
@property (strong,nonatomic) UIButton *landspaceButton;

@property (strong,nonatomic) NSMutableArray *arrayOfButtons;


@end

@implementation DrawingsScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initializeViews];
    [self navigationControllerSetup];
    
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (void)initializeViews {
    
    self.
    
    self.planetButton = [[UIButton alloc] init];
    self.planetButton.frame = CGRectMake(88, 114, 200, 40);
    [self.planetButton setTitle:@"Planet" forState:UIControlStateNormal];
    [self.planetButton initialSetup];

    [self.view addSubview: self.planetButton];
    
    
    self.headButton = [[UIButton alloc] init];
    self.headButton.frame = CGRectMake(88, 169, 200, 40);
    [self.headButton setTitle:@"Head" forState:UIControlStateNormal];
    [self.headButton initialSetup];
    [self.headButton setToHighlitedState];
    
    [self.view addSubview: self.headButton];
    
    
    self.treeButton = [[UIButton alloc] init];
    self.treeButton.frame = CGRectMake(88, 224, 200, 40);
    [self.treeButton setTitle:@"Tree" forState:UIControlStateNormal];
    [self.treeButton initialSetup];

    [self.view addSubview: self.treeButton];
    
    self.landspaceButton = [[UIButton alloc] init];
    self.landspaceButton.frame = CGRectMake(88, 279, 200, 40);
    [self.landspaceButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [self.landspaceButton initialSetup];
    
    [self.view addSubview: self.landspaceButton];
    
    self.arrayOfButtons = [[NSMutableArray alloc] initWithObjects:self.planetButton, self.headButton, self.treeButton,self.landspaceButton, nil];
  
    
    [self.planetButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.headButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.treeButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.landspaceButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)buttonTapped:(UIButton*) sender {
    
    for (UIButton *button in self.arrayOfButtons) {
        if (button == sender) {
            if ([button.titleLabel.text isEqualToString:@"Planet"]) {
                self.canvasView.currentCanvasIdentifier = 1;
                
            } else if ([button.titleLabel.text isEqualToString:@"Head"]) {
                self.canvasView.currentCanvasIdentifier = 2;

            } else if ([button.titleLabel.text isEqualToString:@"Tree"]) {
                self.canvasView.currentCanvasIdentifier = 3;

            } else if ([button.titleLabel.text isEqualToString:@"Landscape"]) {
                self.canvasView.currentCanvasIdentifier = 4;

            }
            
            [button setToHighlitedState];
        } else {
            [button setToDefaultState];
        }
    }
    [self returnToMainVC];
}



- (void)navigationControllerSetup {
    self.navigationController.title = @"Drawings";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Artist"
                                                                      style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(returnToMainVC)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor lightGreenSea];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size: 17]} forState:UIControlStateNormal];
    
    
}

- (void)returnToMainVC {
    [self.navigationController popViewControllerAnimated:YES];
}


@end


