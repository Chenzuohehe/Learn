//
//  ViewController.m
//  CZPieChat
//
//  Created by ChenZuo on 16/9/1.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"
#import "CZPieChatView.h"
#import "PieChatView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    CZPieChatView * view = [[CZPieChatView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor yellowColor];
    
    [view showPie];
    
    [self.view addSubview:view];
    
    PieChatView * pieView = [[PieChatView alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
    pieView.strokeColor = [UIColor yellowColor];
    pieView.percent = 0.88;
    [pieView showPie];
    [self.view addSubview:pieView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
