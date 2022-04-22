//
//  FFSimpleGradientView.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFSimpleGradientView.h"

@interface FFSimpleGradientView ()
@property(nonatomic,strong)
    CAGradientLayer *layerBack;
@end

@implementation FFSimpleGradientView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(CAGradientLayer *)layerBack
{
    if (!_layerBack) {
        _layerBack=[CAGradientLayer layer];
    }
    return _layerBack;
}

-(void)setClearBack:(BOOL)clearBack
{
    _clearBack=clearBack;
    if (clearBack) {
        self.backgroundColor=UIColor.clearColor;
    }
}

-(void)setEnableGrad:(BOOL)enableGrad
{
    _enableGrad=enableGrad;
    if (enableGrad) {
        [self.layer addSublayer:self.layerBack];
    }
    else {
        [self.layerBack removeFromSuperlayer];
    }
}

-(void)setGradFrom:(CGPoint)gradFrom
{
    _gradFrom=gradFrom;
    self.layerBack.startPoint=gradFrom;
}

-(void)setGradTo:(CGPoint)gradTo
{
    _gradTo=gradTo;
    self.layerBack.endPoint=gradTo;
}

-(void)setGradColor1:(UIColor *)gradColor1
{
    _gradColor1=gradColor1;
    if (self.gradColor1
        &&self.gradColor2) {
        [self setGradColors];
    }
}

-(void)setGradColor2:(UIColor *)gradColor2
{
    _gradColor2=gradColor2;
    if (self.gradColor1
        &&self.gradColor2) {
        [self setGradColors];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect rectLayerBack=self.frame;
    rectLayerBack.origin=CGPointZero;
    self.layerBack.frame=rectLayerBack;
}

-(void)setGradColors
{
    self.layerBack.colors=@[
        (__bridge id)self.gradColor1.CGColor,
        (__bridge id)self.gradColor2.CGColor
    ];
}

@end
