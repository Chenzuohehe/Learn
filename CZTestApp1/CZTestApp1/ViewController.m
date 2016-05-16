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
- (IBAction)openZhaoxie:(id)sender {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"zhaoxie:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"zhaoxie:我来自cz1"]];
        
    }else{
        NSLog(@"我没能打开");
    }
    
}


- (IBAction)openEmail:(id)sender {
    //如果能打开email
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mailto:"]]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:first@example.com?cc=second@example.com,third@example.com&bcc=fourth@example.com&subject=my%20email&body=%3Cb%3Eemail%3C/b%3E%E6%88%91%E6%9D%A5%E7%9C%8B%E7%9C%8B%E4%B8%AD%E6%96%87%20body!"]];
        //其中first@example.com 是接收人
        //cc=抄送
        //bcc=密送
        //subject=主题
        //body=内容
        
        
    }
    //其中用中文的需要uft8转换格式
    NSString * mail = @"我是内容";
    //        mail stringByAddingPercentEscapesUsingEncoding:<#(NSStringEncoding)#>
    //        NSString *str = ...; // some URL
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *result = [mail stringByAddingPercentEncodingWithAllowedCharacters:set];//iOS 7.0之后推荐的转换方法
    NSLog(@"11%@",result);
    
//    NSString * utf8mail = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * utf8mail = [result stringByRemovingPercentEncoding];//iOS 9.0之后推荐的转换方法https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/index.html#//apple_ref/occ/instm/NSString/stringByAddingPercentEncodingWithAllowedCharacters:
    NSLog(@"%@",utf8mail);
    
    UIButton * button = [[UIButton alloc]init];
    
    
}



@end
