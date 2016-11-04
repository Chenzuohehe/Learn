//
//  NHHomeViewController.m
//  nei
//
//  Created by ChenZuo on 2016/11/4.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "NHHomeViewController.h"

@interface NHHomeViewController ()

@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
