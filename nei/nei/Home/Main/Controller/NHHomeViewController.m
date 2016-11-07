//
//  NHHomeViewController.m
//  nei
//
//  Created by ChenZuo on 2016/11/4.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "NHHomeViewController.h"
#import "NHCustomSegmentView.h"

@interface NHHomeViewController ()

@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setUpItems{
    WeakSelf(weakSelf);
    NHCustomSegmentView * segment = [[NHCustomSegmentView alloc]initWithItemTitles:@[@"精选",@"关注"]];
    self.navigationItem.titleView = segment;
    segment.frame = CGRectMake(0, 0, 130, 35);
    [segment clickDefault];
    segment.NHCustomSegmentViewBtnClickHandle = ^(NHCustomSegmentView *segment, NSString *currentTitle, NSInteger currentIndex){
        BOOL isFeatured = (currentIndex == 0);
//        weakSelf
    };
}

@end
