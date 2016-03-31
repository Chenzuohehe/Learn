//
//  ViewController.m
//  CordovaLearn
//
//  Created by MAC on 16/3/30.
//  Copyright © 2016年 chenzuo. All rights reserved.
//

#import "ViewController.h"
#import <Cordova/CDVViewController.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CDVViewController * viewController = [CDVViewController new];
    viewController.startPage = @"AccountList.html";
    viewController.wwwFolderName = @"www";
    [viewController.view setFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    
    
    [self.view addSubview:viewController.view];
    [self addChildViewController:viewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
