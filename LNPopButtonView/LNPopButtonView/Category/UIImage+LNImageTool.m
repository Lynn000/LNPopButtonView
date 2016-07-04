//
//  UIImage+LNImageTool.m
//  LNTool
//
//  Created by cong on 16/5/2.
//  Copyright © 2016年 lin. All rights reserved.
//

#import "UIImage+LNImageTool.h"

@implementation UIImage (LNImageTool)

// MARK : - 图片拉伸
+(UIImage *)imageStretchWithImageName:(NSString *)ImageName{
    
    UIImage *image=[UIImage imageNamed:ImageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

// MARK : - 获取原样图片
+ (UIImage *)originalImageWithImageName:(NSString *)imageName{
    
    return [[self imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

// MARK : - 设置文字水印
+ (UIImage *)waterMarkWithOrignImgName:(NSString *)imgName andWaterMarkStr:(NSString *)waterMarkStr andStrAttri:(NSDictionary *)strAttri andImgFrame:(CGRect)imgFrame{
    
    //获取原始图片
    UIImage *origImg = [UIImage imageNamed:imgName];
    
    //开启图片的图形上下文
    UIGraphicsBeginImageContextWithOptions(imgFrame.size, NO, 0.0);
    
    //计算文字大小
    CGSize signSize = [waterMarkStr boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:strAttri context:nil].size;
    
    //计算文字位置
    CGFloat signX = imgFrame.size.width - signSize.width;
    CGFloat signY = imgFrame.size.height - signSize.height;
    
    //绘画图片
    [origImg drawAtPoint:CGPointZero];
    
    //在图片上画水印
    [waterMarkStr drawAtPoint:CGPointMake(signX, signY) withAttributes:strAttri];
    
    //需要获得图片 不管是文字还是水印
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    //返回图片
    return newImg;
}

// MARK : - 设置图片水印
+ (UIImage *)waterMarkWithOrignImgName:(NSString *)imgName andWaterMarkImgName:(NSString *)markImgName andImgFrame:(CGRect)imgFrame{
    
    //获取原始图片
    UIImage *origImg = [UIImage imageNamed:imgName];
    
    //获得水印图片
    UIImage *waterMarkImg = [UIImage imageNamed:markImgName];
    
    //开启图片的图形上下文
    UIGraphicsBeginImageContextWithOptions(imgFrame.size, NO, 0.0);
    
    //计算水印图片位置
    CGFloat signX = imgFrame.size.width - waterMarkImg.size.width;
    CGFloat signY = imgFrame.size.height - waterMarkImg.size.height;
    
    //绘画图片
    [origImg drawAtPoint:CGPointZero];
    
    //在图片上画水印 设置图片协调模式 以及透明度
    [waterMarkImg drawAtPoint:CGPointMake(signX, signY) blendMode:kCGBlendModeLighten alpha:0.8];
    
    //需要获得图片 不管是文字还是水印
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    //返回图片
    return newImg;
}

// MARK : - 获取屏幕截图
+ (UIImage *)getScreenShotImage{
    
    // 获取当前应用界面
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 开启绘画图形上下文
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 1);
    
    // 获取当前图形上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 将界面渲染到上下文中
    [window.layer renderInContext:contextRef];
    
    // 返回图片
    return UIGraphicsGetImageFromCurrentImageContext();
}

// MARK : - 重绘图片
- (UIImage *)repaintImage{
        
    // 手动开启图片图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 将图片绘画上去
    [self drawAtPoint:CGPointZero];
    
    // 从图片图形上下文中获取图片
    UIImage *repaintImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片图形上下文
    UIGraphicsEndImageContext();
    
    return repaintImage;
    
}


























@end
