//
//  LNPopButtonView.m
//  LNPopButtonView
//
//  Created by cong on 16/7/1.
//  Copyright © 2016年 lin. All rights reserved.
//

#import "LNPopButtonView.h"
#import "UIImageView+LNImageViewTool.h"
#import "UIImage+LNImageTool.h"
#import "LNTopImgButton.h"

@interface LNPopButtonView ()

// 按钮信息数组
@property (nonatomic,strong) NSArray *buttonInfoArray;

// 按钮宽度
@property (nonatomic,assign) CGFloat buttonWidth;

// 按钮高度
@property (nonatomic,assign) CGFloat buttonHeight;

// 按钮数组
@property (nonatomic,strong) NSArray * buttonArray;
@end

@implementation LNPopButtonView

#pragma mark - 点击事件
- (void)tapRecognizerClick: (UITapGestureRecognizer *)tap{
    
    [self removeFromSuperview];
}

#pragma mark - 设置控件和布局

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    // 布局子控件按钮
    
    
}

- (void)setupButtons{
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in self.buttonInfoArray) {
        
        LNTopImgButton *button = [[LNTopImgButton alloc]initWithBtnTitle:dict[TitleKey] andBtnImgName:dict[ImageKey] andTitleColor:[UIColor lightGrayColor]];
        
        button.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];

        
        [self addSubview:button];
        [arrayM addObject:button];
    }
    
    self.buttonArray = arrayM.copy;
    
    
}

- (void)setupUI{
    
    // 设置背景图片
//    UIImageView *bgImageView = [UIImageView blurEffectiveWithImage:[UIImage getScreenShotImage]];
    UIImageView *bgImageView = [UIImageView blurEffectiveWithImage:[UIImage imageNamed:@"1原创无图"]];
    
    // 添加控件
    [self addSubview:bgImageView];
    
    // 设置按钮
    [self setupButtons];
    
    
    
    // 添加手势收回
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRecognizerClick:)];
    
    [self addGestureRecognizer:tap];
}


#pragma mark - 初始化方法
// 根据plist文件 设置按钮
- (instancetype)initWithfileName: (NSString *)fileName andButtonW:(CGFloat)buttonW andButtonH:(CGFloat)buttonH{
    
    self = [super init];
    if (self) {
        
        self.buttonInfoArray = [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
        
        self.buttonWidth = buttonW;
        self.buttonHeight = buttonH;
        
        [self setupUI];
    }
    return self;
}

// 根据数组 设置按钮
- (instancetype)initWithArray: (NSArray *)buttonArray andButtonW:(CGFloat)buttonW andButtonH:(CGFloat)buttonH{
    
    self = [super init];
    if (self) {
        
        self.buttonInfoArray = buttonArray;
        
        [self setupUI];
    }
    return self;
}


@end
