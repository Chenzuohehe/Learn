//
//  ViewController.m
//  testRunTime
//
//  Created by ChenZuo on 2016/9/24.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 20, 40, 20);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, @"AlertKey");
    block(buttonIndex);
}

- (void)btnClick
{
    UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"title" message:@"msg" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"continue", nil];
    void (^blcok) (NSInteger) = ^(NSInteger buttonIntdenx){
        if (buttonIntdenx == 0) {
            NSLog(@"cancel");
        }else{
            NSLog(@"continue");
        }
    };
    
    objc_setAssociatedObject(view, @"AlertKey", blcok, OBJC_ASSOCIATION_COPY);
    
    [view show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
