//
//  FFSimpleGradientView.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFSimpleGradientView : UIView

//常用渐变属性
@property(nonatomic,assign)
    IBInspectable BOOL clearBack;
//是否启用渐变背景
@property(nonatomic,assign)
    IBInspectable BOOL enableGrad;
//渐变起始坐标
@property(nonatomic,assign)
    IBInspectable CGPoint gradFrom;
//渐变结束坐标
@property(nonatomic,assign)
    IBInspectable CGPoint gradTo;
//渐变起始颜色
@property(nonatomic,strong,nullable)
    IBInspectable UIColor *gradColor1;
//渐变结束颜色
@property(nonatomic,strong,nullable)
    IBInspectable UIColor *gradColor2;

@end
