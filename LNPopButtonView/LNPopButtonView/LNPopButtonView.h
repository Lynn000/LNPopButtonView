//
//  LNPopButtonView.h
//  LNPopButtonView
//
//  Created by cong on 16/7/1.
//  Copyright © 2016年 lin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ImageKey @"icon"
#define TitleKey @"name"

// 代理事件 给按钮设置点击事件
@protocol LNPopButtonViewDelegate <NSObject>

@optional
- (void)addEventWithButtonArray:(NSArray*)buttonArray;

@end

@interface LNPopButtonView : UIView

// 设置代理属性
@property (nonatomic,weak) id delegate;

// 根据plist文件 设置按钮
+ (instancetype)popBtnViewWithfileName: (NSString *)fileName andButtonW:(CGFloat)buttonW andButtonH:(CGFloat)buttonH andButtonCol:(NSInteger)colCount;

// 根据数组 设置按钮
- (instancetype)initWithArray: (NSArray *)buttonArray andButtonW: (CGFloat)buttonW andButtonH: (CGFloat)buttonH andButtonCol:(NSInteger)colCount;

// 展示页面
- (void)showWithAnimation;

// 页面消失
- (void)dismissWithAnimation;

@end
