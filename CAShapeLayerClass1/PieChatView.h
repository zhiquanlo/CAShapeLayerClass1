//
//  PieChatView.h
//  CAShapeLayerClass1
//
//  Created by 张科 on 16/3/15.
//  Copyright © 2016年 张科. All rights reserved.
//通过CAShapeLayer绘制扇形统计图，指针转动过UIView动画实现， 动态扇形通过定时器实现

#import <UIKit/UIKit.h>

@interface PieChatView : UIView
//设置最底层扇形的颜色
@property (nonatomic, retain)UIColor *firstStrokeColor;
//设置动态变化扇形的颜色
@property (nonatomic, retain)UIColor *secondStrokColor;
//设置圆环CAShapeLayer的颜色
@property (nonatomic, retain)UIColor *ringStrokeColor;

//绘制出整体扇形图，通过赋值百分比，确定动态扇形的大小（percentage）， 扇形距屏幕左边的距离（diatance）
- (void)creatPieChatWithPercentage:(CGFloat)percentage WithDistance:(CGFloat)diatance;
//重写视图的初始化方法设置frame
- (instancetype)initWithFrame:(CGRect)frame;

@end
