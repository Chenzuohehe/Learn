//
//  FirstViewController.m
//  test
//
//  Created by MAC on 16/4/17.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "FirstViewController.h"
#import "TTSwitch.h"
#import "JTMaterialSwitch.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iWant) name:@"123456" object:nil];
    
//    TTSwitch * cSwitch = [[TTSwitch alloc] initWithFrame:CGRectMake(200, 200, 200, 21)];
//    cSwitch.trackImage = [UIImage imageNamed:@"track"];//轨道
////    cSwitch.overlayImage = [UIImage imageNamed:@"overlay"];//覆盖
//    cSwitch.thumbImage = [UIImage imageNamed:@"switchBtn"];//按钮
//    cSwitch.thumbHighlightImage = [UIImage imageNamed:@"switchBtn"];//高亮按钮
//    cSwitch.backgroundColor = [UIColor redColor];
    
    
//    TTSwitch *squareThumbSwitch = [[TTSwitch alloc] initWithFrame:CGRectMake(200, 200, 76, 27)];
//    squareThumbSwitch.trackImage = [UIImage imageNamed:@"square-switch-track"];
//    squareThumbSwitch.overlayImage = [UIImage imageNamed:@"square-switch-overlay"];
//    squareThumbSwitch.thumbImage = [UIImage imageNamed:@"square-switch-thumb"];
//    squareThumbSwitch.thumbHighlightImage = [UIImage imageNamed:@"square-switch-thumb-highlight"];
//    squareThumbSwitch.trackMaskImage = [UIImage imageNamed:@"square-switch-mask"];
//    squareThumbSwitch.thumbMaskImage = nil; // Set this to nil to override the UIAppearance setting
//    squareThumbSwitch.thumbInsetX = -3.0f;
//    squareThumbSwitch.thumbOffsetY = -3.0f;
//    
//    
//    
//    [self.view addSubview:squareThumbSwitch];
    
    
    JTMaterialSwitch *mySwitch = [[JTMaterialSwitch alloc] initWithSize:JTMaterialSwitchSizeCZ state:JTMaterialSwitchStateOn];
    
    mySwitch.isRippleEnabled = NO;
    mySwitch.thumbOnTintColor = [UIColor clearColor];
    mySwitch.thumbOffTintColor = [UIColor clearColor];
    mySwitch.center = CGPointMake(200, 200);
    [self.view addSubview:mySwitch];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)iWant
{
    NSLog(@" first 123456 已经被触发");
}

- (IBAction)back:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"11123456" object:nil];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
