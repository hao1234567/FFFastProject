//
//  UIButton+FFCustom.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIButton扩展
@interface UIButton (FFCustom)
//快速设置默认状态下的按钮文字
@property(nonatomic,copy,nullable)
    NSString *txtNormal;
//快速设置高亮状态下的按钮文字
@property(nonatomic,copy,nullable)
    NSString *txtHighli;
//快速设置默认状态下的按钮图标
@property(nonatomic,strong,nullable)
    UIImage *imgNormal;
//快速设置高亮状态下的按钮图标
@property(nonatomic,strong,nullable)
    UIImage *imgHighli;
//快速设置默认状态下的文字颜色
@property(nonatomic,strong,nullable)
    UIColor *colorNormal;
//快速设置高亮状态下的文字颜色
@property(nonatomic,strong,nullable)
    UIColor *colorHighli;
//快速设置默认状态下的按钮背景图
@property(nonatomic,strong,nullable)
    UIImage *backImgNormal;
//快速设置高亮状态下的按钮背景图
@property(nonatomic,strong,nullable)
    UIImage *backImgHighli;
//按钮倒计时方法
-(void)countdownWithSecond:(NSInteger)second
    delegate:(nonnull void (^)(NSInteger second))delegate;
@end
