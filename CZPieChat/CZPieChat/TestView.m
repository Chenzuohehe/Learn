//
//  TestView.m
//  CZPieChat
//
//  Created by ChenZuo on 16/9/1.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "TestView.h"
@interface TestView()
{
    /**
     *  继承与CALayer 一个图层，可以想象成一个view
     */
    CAShapeLayer * testShapeLayer;
}
@end

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        self = nil;
    }
    
    /**
     这个frame是基于self而言的
     */
    //样式1 矩形坐标
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 150, 100)];
    //矩形坐标 带圆角
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:30];
    //矩形坐标，全倒角？
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 100)];
    //矩形 限定角 限定倒角大小
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(25, 50)];
    //中心 半径 开始弧度 结束弧度 是否顺时针
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2 startAngle:-M_PI_2 endAngle:M_PI_4 clockwise:YES];
    
    /**
     *  类似于初始化
     */
    testShapeLayer = [CAShapeLayer layer];
    testShapeLayer.path = path.CGPath;
    testShapeLayer.fillColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:testShapeLayer];
    
    
    /**======================================================
     下面是帮助理解贝塞尔曲线
     */
    CGPoint startPoint = CGPointMake(0, 300);
    CGPoint endPoint = CGPointMake(250, 300);
    CGPoint controlPoint = CGPointMake(170 , 200);
    
    CALayer * startLayer = [CALayer layer];
    startLayer.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    startLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:startLayer];
    
    CALayer * endLayer = [CALayer layer];
    endLayer.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    endLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:endLayer];
    
    CALayer * controlLayer = [CALayer layer];
    controlLayer.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    controlLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:controlLayer];
    
    /**
     *  一个控制点
     */
    UIBezierPath * linePath = [UIBezierPath bezierPath];
    CAShapeLayer * lineLayer = [CAShapeLayer layer];
    
    [linePath moveToPoint:startPoint];
    [linePath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:lineLayer];
    
    /**
     *  两个控制点
     */
    CGPoint controlPoint2 = CGPointMake(100, 300);
    CALayer * controlLayer2 = [CALayer layer];
    controlLayer2.frame = CGRectMake(controlPoint2.x, controlPoint2.y, 5, 5);
    controlLayer2.backgroundColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:controlLayer2];
    
    CAShapeLayer * lineLayer2 = [CAShapeLayer layer];
    
    UIBezierPath * linePath2 = [UIBezierPath bezierPath];
    [linePath2 moveToPoint:startPoint];
    [linePath2 addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint2];
    lineLayer2.path = linePath2.CGPath;
    lineLayer2.fillColor = [UIColor clearColor].CGColor;
    lineLayer2.strokeColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:lineLayer2];
    
    
    return self;
}

@end
