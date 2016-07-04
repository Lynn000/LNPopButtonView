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
#import <pop.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

typedef enum {
    popAnimationUp = 0,
    popAnimationDown = 1
} popAnimationType;


@interface LNPopButtonView ()

// 按钮信息数组
@property (nonatomic,strong) NSArray *buttonInfoArray;

// 按钮宽度
@property (nonatomic,assign) CGFloat buttonWidth;

// 按钮高度
@property (nonatomic,assign) CGFloat buttonHeight;

// 按钮列数
@property (nonatomic,assign) NSInteger colCount;

// 按钮数组
@property (nonatomic,strong) NSArray * buttonArray;
@end

@implementation LNPopButtonView

#pragma mark - 动画效果
- (void)showWithAnimation{
    
    [self addAnimationWithType:popAnimationUp];

}

- (void)dismissWithAnimation{
    
    [self addAnimationWithType:popAnimationDown];
    
}

// 添加动画效果
- (void)addAnimationWithType:(popAnimationType )animationType {
    
    // 展示显示动画
    [self.buttonArray enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 创建springd动画对象 设置动画属性
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed: kPOPViewCenter];
        
        if (animationType == popAnimationUp) {
            
            // 设置动画toValue
            springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(obj.center.x, obj.center.y - kScreenHeight )];
            
            // 设置动画开始时间
            springAnimation.beginTime = CACurrentMediaTime() + 0.1 * idx;
            
        }else if (animationType == popAnimationDown){
            
            springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(obj.center.x, obj.center.y + kScreenHeight )];

            springAnimation.beginTime = CACurrentMediaTime() + 0.1 * (self.buttonArray.count - idx);
        }
        
        // 设置动画强度
        springAnimation.springBounciness = 10;
        // 设置动画频率
        springAnimation.springSpeed = 5;
        
        
        // 给按钮添加动画效果 key-->用来标记动画
        [obj pop_addAnimation:springAnimation forKey:nil];
        
    }];
    
    // 添加代理事件
    if (self.delegate && animationType == popAnimationUp) {
        [self.delegate addEventWithButtonArray:self.buttonArray];
    }
}

#pragma mark - 点击事件
- (void)tapRecognizerClick: (UITapGestureRecognizer *)tap{
    
    [self dismissWithAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * self.buttonArray.count * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self removeFromSuperview];
    });
}

#pragma mark - 设置控件和布局

// MARK : - 设置按钮
- (void)setupButtons{
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 按钮间隔
    CGFloat btnMargin = ( kScreenWidth - self.colCount * self.buttonWidth ) / ( self.colCount + 1 );
    
    [self.buttonInfoArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LNTopImgButton *button = [[LNTopImgButton alloc]initWithBtnTitle:dict[TitleKey] andBtnImgName:dict[ImageKey] andTitleColor:[UIColor lightGrayColor]];
        
        // 行列计算
        NSInteger row = idx / self.colCount;
        NSInteger col = idx % self.colCount;
        
        // XY计算
        CGFloat buttonX = (btnMargin + self.buttonWidth) * col + btnMargin;
        CGFloat buttonY = (btnMargin + self.buttonHeight) * row + kScreenHeight + 200;
        
        // 设置frame
        button.frame = CGRectMake(buttonX, buttonY, self.buttonWidth, self.buttonHeight);
        
        [self addSubview:button];
        [arrayM addObject:button];
    }];
    
    self.buttonArray = arrayM.copy;
    
    
}

// MARK : - 设置控件
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
// MARK : - 根据plist文件 设置按钮
+ (instancetype)popBtnViewWithfileName: (NSString *)fileName andButtonW:(CGFloat)buttonW andButtonH:(CGFloat)buttonH andButtonCol:(NSInteger)colCount{
    
    NSArray *array = [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
    
    return [[LNPopButtonView alloc]initWithArray:array andButtonW:buttonW andButtonH:buttonH andButtonCol:colCount];
}

// MARK : - 根据数组 设置按钮
- (instancetype)initWithArray: (NSArray *)buttonArray andButtonW:(CGFloat)buttonW andButtonH:(CGFloat)buttonH  andButtonCol:(NSInteger)colCount{
    
    self = [super init];
    if (self) {
        
        self.buttonInfoArray = buttonArray;
        self.buttonWidth = buttonW;
        self.buttonHeight = buttonH;
        self.colCount = colCount;
        
        [self setupUI];
    }
    return self;
}


@end
