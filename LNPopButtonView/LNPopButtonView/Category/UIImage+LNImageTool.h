//
//  UIImage+LNImageTool.h
//  LNTool
//
//  Created by cong on 16/5/2.
//  Copyright © 2016年 lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LNImageTool)

// 图片拉伸方法
+(UIImage *)imageStretchWithImageName:(NSString *)ImageName;

// 获取原本图片方法（取消系统渲染效果）
+ (UIImage *)originalImageWithImageName:(NSString *)imageName;

// 设置文字水印
+ (UIImage *)waterMarkWithOrignImgName:(NSString *)imgName andWaterMarkStr:(NSString *)waterMarkStr andStrAttri:(NSDictionary *)strAttri andImgFrame:(CGRect)imgFrame;

// 设置图片水印
+ (UIImage *)waterMarkWithOrignImgName:(NSString *)imgName andWaterMarkImgName:(NSString *)markImgName andImgFrame:(CGRect)imgFrame;

// 获取屏幕截图
+ (UIImage *)getScreenShotImage;

// 重绘图片
- (UIImage *)repaintImage;

@end
