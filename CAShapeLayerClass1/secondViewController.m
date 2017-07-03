//
//  secondViewController.m
//  CAShapeLayerClass1
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "secondViewController.h"
#import "PieChatView.h"
@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PieChatView *chatView = [[PieChatView alloc] initWithFrame:self.view.bounds];
    [chatView creatPieChatWithPercentage:0.75 WithDistance:30];
    [self.view addSubview:chatView];
    UIButton *butotn = [UIButton buttonWithType:UIButtonTypeCustom];
    butotn.frame = CGRectMake(20, screenHeight - 70, 70, 50);
    [butotn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [butotn setTitle:@"点击" forState:UIControlStateNormal];
    [self.view addSubview: butotn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonClick:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
