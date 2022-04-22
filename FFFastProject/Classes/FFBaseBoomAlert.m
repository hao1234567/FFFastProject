//
//  FFBaseBoomAlert.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFBaseBoomAlert.h"

@interface FFBaseBoomAlert ()

@end

@implementation FFBaseBoomAlert

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)showInSuper:(UIView *)viewSuper
{
    [super showInSuper:viewSuper];
    [self makeAlertAnimation];
}

-(void)showInSuper:(UIView *)viewSuper
    frame:(CGRect)rectView
{
    [super showInSuper:viewSuper
        frame:rectView];
    [self makeAlertAnimation];
}

-(void)clickCancel:(id)sender
{
    [self hiddenView];
}

-(void)makeAlertAnimation {
    CAKeyframeAnimation *popAnimation=
        [CAKeyframeAnimation
            animationWithKeyPath:@"transform"];
    popAnimation.duration=0.4;
    popAnimation.values=@[
        [NSValue valueWithCATransform3D:
            CATransform3DMakeScale(0.01f,0.01f,1.0f)],
        [NSValue valueWithCATransform3D:
            CATransform3DMakeScale(1.1f,1.1f,1.0f)],
        [NSValue valueWithCATransform3D:
            CATransform3DMakeScale(0.9f,0.9f,1.0f)],
        [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes=@[@0.0f,@0.5f,@0.75f,@1.0f];
    popAnimation.timingFunctions=@[
        [CAMediaTimingFunction functionWithName:
            kCAMediaTimingFunctionEaseInEaseOut],
         [CAMediaTimingFunction functionWithName:
            kCAMediaTimingFunctionEaseInEaseOut],
        [CAMediaTimingFunction functionWithName:
            kCAMediaTimingFunctionEaseInEaseOut]];
    [self.viewContent.layer addAnimation:popAnimation forKey:nil];
}

@end
