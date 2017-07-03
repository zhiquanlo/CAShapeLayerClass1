//
//  PieChatView.m
//  CAShapeLayerClass1
//
//  Created by 张科 on 16/3/15.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "PieChatView.h"

@implementation PieChatView
{
    CAShapeLayer *firstShapeLayer;
    CAShapeLayer *secondShapeLayer;
    CAShapeLayer *ringShapeLayer;
    UIImageView *arror;
    UIImageView *pointImage;
    UIView *arrorView;
    NSInteger count;
    NSTimer *timer;
    NSInteger Percentage;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        count = 0;
    }
    return self;
}

- (void)creatPieChatWithPercentage:(CGFloat)percentage WithDistance:(CGFloat)diatance {
    Percentage = (NSInteger)(percentage * 100);
    firstShapeLayer = [CAShapeLayer layer];
    firstShapeLayer.frame = CGRectMake(0, 0 , 50 + screenWidth / 2.0  - diatance, 50 + screenWidth / 2.0  - diatance);
    firstShapeLayer.position = self.center;
    firstShapeLayer.lineWidth = screenWidth / 2.0 - 50 - diatance;
    firstShapeLayer.fillColor = [UIColor clearColor].CGColor;
    firstShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    firstShapeLayer.strokeStart = 0.5;
    firstShapeLayer.strokeEnd = 1.0;
    UIBezierPath *firstPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0 , 50 + screenWidth / 2.0  - diatance, 50 + screenWidth / 2.0  - diatance)];
    firstShapeLayer.path = firstPath.CGPath;
    [self.layer addSublayer:firstShapeLayer];
    secondShapeLayer = [CAShapeLayer layer];
    secondShapeLayer.frame = CGRectMake(0, 0, 50 + screenWidth / 2.0  - diatance, 50 + screenWidth / 2.0  - diatance);
    secondShapeLayer.position = self.center;
    secondShapeLayer.lineWidth = screenWidth / 2.0 - 50 - diatance;
    secondShapeLayer.fillColor = [UIColor clearColor].CGColor;
    secondShapeLayer.strokeColor =[UIColor colorWithRed:248 / 255.0 green:75 / 255.0  blue:29 / 255.0 alpha:1.0].CGColor;
;
    secondShapeLayer.strokeStart = 0.5;
    secondShapeLayer.strokeEnd = 0.5 ;
    secondShapeLayer.path = firstPath.CGPath;
    [self.layer addSublayer:secondShapeLayer];
    ringShapeLayer = [CAShapeLayer layer];
    ringShapeLayer.frame = CGRectMake(0, 0, 40, 40);
    ringShapeLayer.position = self.center;
    ringShapeLayer.lineWidth = 8;
    ringShapeLayer.fillColor = [UIColor clearColor].CGColor;
    ringShapeLayer.strokeColor =[UIColor whiteColor].CGColor;
    ;
    UIBezierPath *ringPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 40, 40)];
    ringShapeLayer.strokeStart = .0;
    ringShapeLayer.strokeEnd = 1.0;
    ringShapeLayer.path = ringPath.CGPath;
    [self.layer addSublayer:ringShapeLayer];
    
    arrorView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:arrorView];
    arror = [[UIImageView alloc] initWithFrame:CGRectMake(diatance, arrorView.center.y - 8, screenWidth / 2.0 - diatance, 16)];
    arror.image = [UIImage imageNamed:@"jiantou.png"];
    [arrorView addSubview:arror];
    
    
    UIView *tempView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:tempView];
    
    pointImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth - 2 * diatance - 12, (screenWidth - 2 * diatance - 12) / 2.0)];
    pointImage.image = [UIImage imageNamed:@"diandian.png"];
    pointImage.center = self.center;
    pointImage.frame = CGRectMake(pointImage.frame.origin.x, pointImage.frame.origin.y - (screenWidth - 2 * diatance - 12) / 4.0, pointImage.frame.size.width, pointImage.frame.size.height);
    [self addSubview:pointImage];
    
    [self performSelector:@selector(animationStart) withObject:self afterDelay:1.0];


}

- (void)animationStart {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    [UIView animateWithDuration:Percentage * 0.027 animations:^{
        arrorView.transform = CGAffineTransformMakeRotation(M_PI * Percentage / 100.0);
        
    }];

}

- (void)timer {
    count ++;
    secondShapeLayer.strokeEnd = 0.5 + 0.5 / 100 * count;
    
    if (count == Percentage) {
        [timer invalidate];
    }

}

@synthesize firstStrokeColor = _firstStrokeColor;
- (void)setFirstStrokeColor:(UIColor *)firstStrokeColor {
    _firstStrokeColor = firstStrokeColor;
    firstShapeLayer.strokeColor = _firstStrokeColor.CGColor;
}

- (UIColor *)firstStrokeColor {
    return _firstStrokeColor;
}
@synthesize secondStrokColor = _secondStrokColor;
- (void)setSecondStrokColor:(UIColor *)secondStrokColor {
    secondShapeLayer.strokeColor = secondStrokColor.CGColor;
    _secondStrokColor = secondStrokColor;
}
- (UIColor *)secondStrokColor {
    return _secondStrokColor;
}

@synthesize ringStrokeColor = _ringStrokeColor;

- (void)setRingStrokeColor:(UIColor *)ringStrokeColor {
    ringShapeLayer.strokeColor = ringStrokeColor.CGColor;
    _ringStrokeColor = ringStrokeColor;
}

- (UIColor *)ringStrokeColor {
    return _ringStrokeColor;
}

@end
