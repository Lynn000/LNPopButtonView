//
//  ViewController.m
//  LNPopButtonView
//
//  Created by David on 16/7/4.
//  Copyright © 2016年 topcoders. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+LNImageViewTool.h"
#import "LNPopButtonView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    popBtn.frame = CGRectMake(100, 100, 100, 100);
    popBtn.backgroundColor = [UIColor blueColor];
    [popBtn setTitle:@"pop" forState:UIControlStateNormal];
    [popBtn setTintColor:[UIColor redColor]];
    [popBtn addTarget:self action:@selector(popBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:popBtn];
}

// 弹窗按钮
- (void)popBtnClick
{
    
    LNPopButtonView *popView = [[LNPopButtonView alloc]initWithfileName:@"compose.plist" andButtonW:80 andButtonH:110];
    
    popView.frame = self.view.bounds;
    
    [self.view addSubview:popView];
    
    
}

@end
