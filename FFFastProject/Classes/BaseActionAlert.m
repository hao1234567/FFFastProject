//
//  BaseActionAlert.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "BaseActionAlert.h"

#define kAppHeight ([UIScreen mainScreen].bounds.size.height)

@interface BaseActionAlert ()
@property(nonatomic,assign)
    CGFloat floatRoundedTop;
@end

@implementation BaseActionAlert

#pragma mark - 视图生命周期

-(void)awakeFromNib {
    [super awakeFromNib];
    self.consSafeAreaBottom.constant=
        self.layoutSafeArea.bottom;
    self.consContentBottom.constant=-kAppHeight;
    [self layoutIfNeeded];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    {
        UIBezierPath *path=
            [UIBezierPath bezierPathWithRoundedRect:self.viewContent.bounds
                byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight
                cornerRadii:CGSizeMake(self.floatRoundedTop, self.floatRoundedTop)];
        CAShapeLayer *layer=[[CAShapeLayer alloc]init];
        layer.frame=self.viewContent.bounds;
        layer.path=path.CGPath;
        self.viewContent.layer.mask=layer;
    }
}

#pragma mark - 重写继承方法

-(void)showInSuper:(UIView *)viewSuper
{
    [super showInSuper:viewSuper];
    [self showContentWithAnimation];
}

-(void)showInSuper:(UIView *)viewSuper
    frame:(CGRect)rectView
{
    [super showInSuper:viewSuper
        frame:rectView];
    [self showContentWithAnimation];
}
-(void)hiddenView
{
    [self hiddenContentWithAnimation];
}

#pragma mark - 事件响应方法

-(void)clickCancel:(id)sender
{
    [self hiddenView];
}

#pragma mark - 定义公开方法

- (void)makeRoundedTopWithRadius:(CGFloat)radius
{
    self.floatRoundedTop=radius;
    [self layoutIfNeeded];
}

-(void)showContentWithAnimation {
    self.consContentBottom.constant=-kAppHeight;
    [self layoutIfNeeded];
    [UIView animateWithDuration:0.1 animations:^{
        self.consContentBottom.constant=0;
        [self layoutIfNeeded];
    }];
}

-(void)hiddenContentWithAnimation {
    [UIView animateWithDuration:0.1 animations:^{
        self.consContentBottom.constant=-kAppHeight;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - 定义私有方法

-(UIWindow *)keyWindow
{
    NSArray *arrWindows=
        [UIApplication sharedApplication].windows;
    return arrWindows[0];
}

-(UIEdgeInsets)layoutSafeArea
{
    if (@available(iOS 11.0, *)) {
        UIWindow *window=self.keyWindow;
        UIEdgeInsets edgeSafeArea=
            window.safeAreaInsets;
        if (edgeSafeArea.top<=0) {
            edgeSafeArea.top=20;
        }
        return edgeSafeArea;
    }
    return UIEdgeInsetsMake(20, 0, 0, 0);
}

@end
