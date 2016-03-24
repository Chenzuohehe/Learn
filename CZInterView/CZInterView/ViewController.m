//
//  ViewController.m
//  CZInterView
//
//  Created by MAC on 16/3/11.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * arr = @[@"11",@"12",@"11",@"13",@"15",@"11"];
    //方法1
//    NSMutableArray * mutArr = [NSMutableArray array];
//    for (NSString * item in arr) {
//        if (![mutArr containsObject:item]) {
//            [mutArr addObject:item];
//        }
//    }
//    
//    NSLog(@"mutArr:%@",mutArr);
    
    //方法2
    NSMutableDictionary * Mydic = [NSMutableDictionary dictionary];
    for (NSString * item in arr) {
        [Mydic setObject:item forKey:item];
    }
    NSArray * newArr = [Mydic allKeys];
    NSLog(@"%@",newArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
