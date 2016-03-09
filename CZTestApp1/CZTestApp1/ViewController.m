//
//  ViewController.m
//  CZTestApp1
//
//  Created by MAC on 16/3/7.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openCZTestApp2:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"CZTestApp2:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"CZTestApp2:"]];
        
    }else{
        NSLog(@"我没能打开");
    }
    
}



@end
