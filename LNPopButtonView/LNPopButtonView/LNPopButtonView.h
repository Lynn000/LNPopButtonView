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

@interface LNPopButtonView : UIView

// 根据plist文件 设置按钮
- (instancetype)initWithfileName: (NSString *)fileName andButtonW: (CGFloat)buttonW andButtonH: (CGFloat)buttonH;

// 根据数组 设置按钮
- (instancetype)initWithArray: (NSArray *)buttonArray andButtonW: (CGFloat)buttonW andButtonH: (CGFloat)buttonH;

@end
