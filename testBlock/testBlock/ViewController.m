//
//  ViewController.m
//  testBlock
//
//  Created by ChenZuo on 2016/10/14.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()<NextViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)nextView:(id)sender {
    NextViewController * nextViewController = [[NextViewController alloc]init];
    nextViewController.delegate = self;
    nextViewController.myBlock = ^(NSString * text){
        [self resetLabel:text];
    };
    nextViewController.colorBlock = ^(UIColor * color){
        self.view.backgroundColor = color;
    };
    [self presentViewController:nextViewController animated:YES completion:^{
        
    }];
}

//- (void)popTextValue:(NSString *)text
//{
//    self.nextBtn.titleLabel.text = text;
//}
- (void)resetLabel:(NSString *)text
{
    if (text.length > 0) {
        self.nextBtn.titleLabel.text = text;
    }else{
        self.nextBtn.titleLabel.text = @"button";
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
