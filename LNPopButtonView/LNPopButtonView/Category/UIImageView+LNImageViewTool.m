//
//  UIImageView+LNImageViewTool.m
//  LNPopButtonView
//
//  Created by cong on 16/7/1.
//  Copyright © 2016年 lin. All rights reserved.
//

#import "UIImageView+LNImageViewTool.h"

@implementation UIImageView (LNImageViewTool)

+ (UIImageView *)blurEffectiveWithImage:(UIImage *)oriImage{
    
    UIImageView *blurImgView = [[UIImageView alloc]initWithImage:oriImage];
    
    // 创建毛玻璃效果
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    // 创建效果视图
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    
    // 添加到图片上
    [blurImgView addSubview:blurView];
    
    // 给效果视图布局
    blurView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *blurH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blurView]|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"blurView" : blurView}];
    NSArray *blurV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[blurView]|" options:NSLayoutFormatAlignAllLeading metrics:nil views:@{@"blurView" : blurView}];

    
    [blurImgView addConstraints:blurH];
    [blurImgView addConstraints:blurV];

    
    return blurImgView;
}

@end
