//
//  NHMainTabBarController.m
//  neihan
//
//  Created by ChenZuo on 2016/11/3.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "NHMainTabBarController.h"

@interface NHMainTabBarController ()

@end

@implementation NHMainTabBarController

+ (void)initialize
{
    //设置不透明
    [[UITabBar appearance] setTranslucent:NO];
    //设置背景颜色
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    //拿到导航控制器
    UITabBarItem * item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    //normal
    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.62f green:0.33f blue:0.27f alpha:1.00f];
    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    //select
    NSMutableDictionary * selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)addChildViewControllerWithClassName:(NSString *)className imageName:(NSString *)imageName title:(NSString *)title
{
    UIViewController * vc = [[NSClassFromString(className) alloc]init];
    
}



@end
