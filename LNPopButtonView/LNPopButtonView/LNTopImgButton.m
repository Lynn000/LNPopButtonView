//
//  LNTopImgButton.m
//  LNPopButtonView
//
//  Created by cong on 16/7/1.
//  Copyright © 2016年 lin. All rights reserved.
//

#import "LNTopImgButton.h"

@implementation LNTopImgButton

#pragma mark - 控件布局
- (void)layoutSubviews{
    
    [super layoutSubviews];

    // 给图片设置frame
    self.imageView.center = CGPointMake(self.bounds.size.width * 0.5, self.imageView.image.size.height * 0.5);
    
    // 给文字设置frame
    CGRect tempFrame = self.titleLabel.frame;
    tempFrame.origin.x = 0;
    tempFrame.origin.y = self.imageView.image.size.height;
    tempFrame.size.width = self.bounds.size.width;
    
    self.titleLabel.frame = tempFrame;
}

#pragma mark - 初始化方法
- (instancetype)initWithBtnTitle:(NSString *)btnTitle andBtnImgName:(NSString *)btnImgName andTitleColor:(UIColor *)titleColor{
    
    self = [super init];
    
    if (self) {
        
        [self setTitle:btnTitle forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:btnImgName] forState:UIControlStateNormal];
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
