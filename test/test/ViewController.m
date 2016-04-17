//
//  ViewController.m
//  test
//
//  Created by MAC on 16/4/2.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSDecimalNumber * allPriceNum = [[NSDecimalNumber init]initWithString:@"8500"];
//    NSLog( @"%@",allPriceNum);
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"BankListXE"ofType:@"json"];
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
