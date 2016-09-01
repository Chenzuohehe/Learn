//
//  PieChatView.h
//  CZPieChat
//
//  Created by ChenZuo on 16/9/1.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieChatView : UIView

@property (strong, nonatomic) UIColor * strokeColor;
@property (assign, nonatomic) CGFloat percent;
- (void)showPie;
@end
