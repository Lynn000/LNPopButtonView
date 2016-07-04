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


@interface ViewController ()<LNPopButtonViewDelegate>

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
    
    LNPopButtonView *popView = [LNPopButtonView popBtnViewWithfileName:@"compose.plist" andButtonW:80 andButtonH:110 andButtonCol:3];
    
    popView.frame = self.view.bounds;
    
    popView.delegate = self;
    
    [self.view addSubview:popView];
    
    [popView showWithAnimation];
    
}

// 实现代理方法 给按钮添加点击事件
- (void)addEventWithButtonArray:(NSArray *)buttonArray{
    
    [buttonArray enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj addTarget:self action:@selector(testOne) forControlEvents:UIControlEventTouchUpInside];
    }];
    
}

- (void)testOne{
    
    NSLog(@"button click one");
}

@end
