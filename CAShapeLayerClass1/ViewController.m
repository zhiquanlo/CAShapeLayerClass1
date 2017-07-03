//
//  ViewController.m
//  CAShapeLayerClass1
//
//  Created by 张科 on 16/3/14.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#define Percentage 75
@interface ViewController ()
{
    NSInteger count;
    NSTimer *timer;
    UIImageView *arrow;
    UIView *four;
    CAShapeLayer *secShapeLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *one = [[UIView alloc] initWithFrame:self.view.bounds];
    UIView *two = [[UIView alloc] initWithFrame:self.view.bounds];
    UIView *three = [[UIView alloc] initWithFrame:self.view.bounds];
    four = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:one];
    [self.view addSubview:two];
    [self.view addSubview:three];
    [self.view addSubview:four];

    // Do any additional setup after loading the view, typically from a nib.
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 200, 200);
    shapeLayer.position = self.view.center;
//    设置贝塞尔曲线内部的填充曲线
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.lineWidth = 120;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor ;
    //圆形贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0 , 0, 200, 200)];
    //椭圆内塞尔曲线
//    UIBezierPath *ovalpath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 100)];
    //矩形贝塞尔曲线
//    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 150, 150)];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeStart = 0.5;
    shapeLayer.strokeEnd = 1;
    [one.layer addSublayer:shapeLayer];
    
    
    //第二层扇形layer 248 75 29
    secShapeLayer = [CAShapeLayer layer];
    secShapeLayer.frame = CGRectMake(0, 0, 200, 200);
    secShapeLayer.fillColor = [UIColor clearColor].CGColor;
    secShapeLayer.position = self.view.center;
    secShapeLayer.lineWidth = 120;
    secShapeLayer.strokeColor = [UIColor colorWithRed:248 / 255.0 green:75 / 255.0  blue:29 / 255.0 alpha:1.0].CGColor;
    secShapeLayer.strokeStart = .5;
    secShapeLayer.strokeEnd = .5;
    secShapeLayer.path = path.CGPath;
    [two.layer addSublayer:secShapeLayer];
    
    //第三层layer
    CAShapeLayer *ringLayer = [CAShapeLayer layer];
    ringLayer.frame = CGRectMake(0, 0, 30, 30);
    ringLayer.position = self.view.center;
    ringLayer.lineWidth = 8;
    ringLayer.fillColor = [UIColor clearColor].CGColor;
    ringLayer.strokeColor = [UIColor whiteColor].CGColor;
    UIBezierPath *threePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 30, 30)];
    ringLayer.path = threePath.CGPath;
    [three.layer addSublayer:ringLayer];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    UIImageView *point = [[UIImageView alloc] initWithFrame: CGRectMake((width - 310) / 2.0, height / 2.0 - 165, 310, 160)];
//    point.backgroundColor = [UIColor redColor];
    point.image = [UIImage imageNamed:@"测谎-back1.png"];
    [self.view addSubview:point];
    
    arrow = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 140, 10)];
    //    point.backgroundColor = [UIColor redColor];
    arrow.center = self.view.center;
    arrow.image = [UIImage imageNamed:@"测谎-指针.png"];
    arrow.frame = CGRectMake(arrow.frame.origin.x - 77, arrow.frame.origin.y , arrow.frame.size.width, arrow.frame.size.height);
    count = 0;
    [four addSubview:arrow];
   
    [self performSelector:@selector(animationStart) withObject:self afterDelay:1.0];
    
    return;
    
    UIButton *butotn = [UIButton buttonWithType:UIButtonTypeCustom];
    butotn.frame = CGRectMake(20, screenHeight - 70, 70, 50);
    [butotn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [butotn setTitle:@"点击" forState:UIControlStateNormal];
    [self.view addSubview: butotn];
}

- (void)buttonClick:(UIButton *)button
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    secondViewController *vc = [storybord instantiateViewControllerWithIdentifier:@"secondViewController"];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}
- (void)animationStart {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    [UIView animateWithDuration:Percentage * 0.027 animations:^{
        four.transform = CGAffineTransformMakeRotation(M_PI * 60 / 100.0);

    }];
    
    
}

- (void)timer {
    count ++;
    secShapeLayer.strokeEnd = 0.5 + 0.5 / 100 * count;

    if (count == Percentage) {
        [timer invalidate];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
