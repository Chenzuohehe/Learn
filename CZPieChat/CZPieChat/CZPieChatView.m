//
//  CZPieChatView.m
//  CZPieChat
//
//  Created by ChenZuo on 16/9/1.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "CZPieChatView.h"
#import "CALayer+PieChat.h"

@interface CZPieChatView()
{
    CAShapeLayer *checkShapeLayer;
}

@end

@implementation CZPieChatView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        self = nil;
    }
    
    //self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.6];
    
    /**
     *  这东西应该算百分比吧
     */
//    self.checkStrokeStart = 0.038;
//    self.checkStrokeEnd = 0.195;
//    self.circleStrokeStart = 0.28;
//    self.circleStrokeEnd = 1;
    
    
//    //创建半透明白色圆环作为基底
//    self.layer.borderWidth = 3.0f;
//    self.layer.cornerRadius = self.frame.size.width/2.0;
//    self.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
    
    CGPoint centerPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                          radius:50
                                                      startAngle:-M_PI_2
                                                        endAngle:M_PI_2 * 3
                                                       clockwise:YES];
    
    
//    checkShapeLayer = [CAShapeLayer layer];
//    checkShapeLayer.path = bgPath.CGPath; //这里的checkPath就是之前我们生成的path路径
//    checkShapeLayer.lineWidth = 50 * 2;//线宽
//    checkShapeLayer.lineCap = kCALineCapRound;//layer边缘的样式
//    checkShapeLayer.lineJoin = kCALineJoinRound;//layer衔接部分的样式
//    checkShapeLayer.strokeColor = [UIColor blackColor].CGColor;//layer描边的颜色，
//    checkShapeLayer.fillColor = [UIColor yellowColor].CGColor;//layer填充的颜色，注意，这和stroke不一样
//    checkShapeLayer.actions = [[NSDictionary alloc] initWithObjectsAndKeys:
//                               [NSNull null],@"strokeStart",[NSNull null],@"strokeEnd", nil];//layer增加动画事件
    checkShapeLayer = [CAShapeLayer layer];
    checkShapeLayer.fillColor   = [UIColor clearColor].CGColor;
    checkShapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    checkShapeLayer.strokeStart = 0.0f;
    checkShapeLayer.strokeEnd   = 0.50f;
    checkShapeLayer.zPosition   = 1;
    checkShapeLayer.lineWidth   = 50 * 2.0f;
    checkShapeLayer.path        = bgPath.CGPath;
    
    [self.layer addSublayer:checkShapeLayer];
    
    
    
    return self;
}

- (void)showPie
{
//    CABasicAnimation *strokeStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
//    
//    
//    strokeStart.toValue = [NSNumber numberWithFloat:0];//动画的最终位置
//    strokeStart.duration = 40;//动画之行的时长
//    strokeStart.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :0.4 :0.3 :1];
//    /**
//     http://netcetera.org/camtf-playground.html
//     动画的步速这个是有关速率的贝塞尔曲线
//     这条贝塞尔曲线的斜率就是速率
//     */
//    
//    [checkShapeLayer ocb_applyAnimation:strokeStart];
    
    //画图动画
    self.hidden = NO;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration  = 10;
    animation.fromValue = @0.0f;
    animation.toValue   = @0.50f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    [checkShapeLayer addAnimation:animation forKey:@"circleAnimation"];
}



- (CGPathRef)checkPath
{
    CGPoint centerPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    UIBezierPath* oval1Path = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                                                    radius:50
                                                                                startAngle:-M_PI_2
                                                                                  endAngle:M_PI_2 * 3
                                                                                 clockwise:YES];
    CGPathRef pathRef = oval1Path.CGPath;
    return pathRef;
}

@end
