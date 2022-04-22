//
//  FFBaseControlView.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFBaseControlView.h"
#import "UIView+FFCustom.h"

@implementation FFBaseControlView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)showInSuper:(UIView *)viewSuper
{
    if (!viewSuper) {
        return;
    }
    CGRect rectView=viewSuper.frame;
    rectView.origin=CGPointZero;
    [self showInSuper:viewSuper frame:rectView];
}

-(void)showInSuper:(UIView *)viewSuper
    frame:(CGRect)rectView
{
    if (!viewSuper) {
        return;
    }
    self.frame=rectView;
    self.enableAutoresizing=false;
    [viewSuper addSubview:self];
}

-(void)hiddenView
{
    [self removeFromSuperview];
}

@end
