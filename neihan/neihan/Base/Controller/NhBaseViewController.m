//
//  NhBaseViewController.m
//  neihan
//
//  Created by ChenZuo on 2016/11/3.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "NhBaseViewController.h"
#import "UIBarButtonItem+Addition.h"

@interface NhBaseViewController ()

@end

@implementation NhBaseViewController

+ (void)initialize
{
    [[UINavigationBar appearance] setTranslucent:NO];
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.86f green:0.85f blue:0.80f alpha:1.00f];
    NSMutableDictionary * color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    color[NSForegroundColorAttributeName] =[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
