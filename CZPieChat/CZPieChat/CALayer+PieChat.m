//
//  CALayer+PieChat.m
//  CZPieChat
//
//  Created by ChenZuo on 16/9/1.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "CALayer+PieChat.h"

@implementation CALayer (CALayer_PieChat)

- (void)ocb_applyAnimation:(CABasicAnimation *)animation
{
    if (animation.fromValue == nil) {
        animation.fromValue = [self.presentationLayer valueForKey:animation.keyPath];
        //从动画演示层presentationLayer 获取之前的状态，并且设定为fromValue再设定toValue，和animation开始执行动画
    }
    
    [self addAnimation:animation forKey:animation.keyPath];
    [self setValue:animation.toValue forKey:animation.keyPath];
}

@end
