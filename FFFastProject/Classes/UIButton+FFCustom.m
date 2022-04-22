//
//  UIButton+FFCustom.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "UIButton+FFCustom.h"

@implementation UIButton (FFCustom)

-(NSString *)txtNormal
{
    return [self titleForState:UIControlStateNormal];
}

-(void)setTxtNormal:(NSString *)txtNormal
{
    [self setTitle:txtNormal forState:UIControlStateNormal];
}

-(NSString *)txtHighli
{
    return [self titleForState:UIControlStateHighlighted];
}

-(void)setTxtHighli:(NSString *)txtHighli
{
    [self setTitle:txtHighli forState:UIControlStateHighlighted];
}

-(UIImage *)imgNormal
{
    return [self imageForState:UIControlStateNormal];
}

-(void)setImgNormal:(UIImage *)imgNormal
{
    [self setImage:imgNormal forState:UIControlStateNormal];
}

-(UIImage *)imgHighli
{
    return [self imageForState:UIControlStateHighlighted];
}

-(void)setImgHighli:(UIImage *)imgHighli
{
    [self setImage:imgHighli forState:UIControlStateHighlighted];
}

-(UIColor *)colorNormal
{
    return [self titleColorForState:UIControlStateNormal];
}

-(void)setColorNormal:(UIColor *)colorNormal
{
    [self setTitleColor:colorNormal forState:UIControlStateNormal];
}

-(UIColor *)colorHighli
{
    return [self titleColorForState:UIControlStateHighlighted];
}

-(void)setColorHighli:(UIColor *)colorHighli
{
    [self setTitleColor:colorHighli forState:UIControlStateHighlighted];
}

-(UIImage *)backImgNormal
{
    return [self backgroundImageForState:UIControlStateNormal];
}

-(void)setBackImgNormal:(UIImage *)backImgNormal
{
    [self setBackgroundImage:backImgNormal forState:UIControlStateNormal];
}

-(UIImage *)backImgHighli
{
    return [self backgroundImageForState:UIControlStateHighlighted];
}

-(void)setBackImgHighli:(UIImage *)backImgHighli
{
    [self setBackgroundImage:backImgHighli forState:UIControlStateHighlighted];
}

-(void)countdownWithSecond:(NSInteger)second
    delegate:(void (^)(NSInteger))delegate
{
    __weak typeof(self) weakSelf=self;
    //倒计时时间
    __block NSInteger timeOut = second;
    dispatch_queue_t queue =
        dispatch_get_global_queue(
        DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer =
        dispatch_source_create(
        DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(
        _timer,dispatch_walltime(NULL, 0)
        , 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        //倒计时结束或需要关闭
        if (!weakSelf) {
            dispatch_source_cancel(_timer);
        }
        else if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                delegate(timeOut);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                delegate(timeOut);
                timeOut--;
            });
        }
    });
    dispatch_resume(_timer);
}

@end
