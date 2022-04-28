//
//  BaseActionAlert.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFBaseControlView.h"

@interface BaseActionAlert : FFBaseControlView
//弹窗内容部分（类似于UIAlert中间白色部分）
@property(nonatomic,weak,nullable) IBOutlet
    UIView *viewContent;
//安全区域占位组件的高度
@property (nonatomic,weak,nullable) IBOutlet
    NSLayoutConstraint *consSafeAreaBottom;
//底部约束
@property (nonatomic,weak,nullable) IBOutlet
    NSLayoutConstraint *consContentBottom;
//关闭按钮事件响应方法
- (IBAction)clickCancel:(nonnull id)sender;
//简化iPhone刘海屏圆角风格适配
- (void)makeRoundedTopWithRadius:(CGFloat)radius;
//显示动画
-(void)showContentWithAnimation;
//隐藏动画
-(void)hiddenContentWithAnimation;
@end
