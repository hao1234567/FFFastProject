//
//  UIView+FFCustom.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFBaseDelegateProtocol.h"

@interface UIView (FFCustom)
//快速设置视图的radius
@property(nonatomic,assign)
    IBInspectable CGFloat layerRadius;
//快速设置视图的borderWidth
@property(nonatomic,assign)
    IBInspectable CGFloat borderWidth;
//快速设置视图的borderColor
@property(nonatomic,strong,nullable)
    IBInspectable UIColor *borderColor;
//快速设置autoresizingMask
@property(nonatomic,assign)
    BOOL enableAutoresizing;
//获取在window视图坐标系的frame
@property(nonatomic,assign,readonly)
    CGRect frameInWindow;
//获取在目标视图坐标系的frame
-(CGRect)frameInView:(nonnull UIView *)view;
//从视图层级中获取特定类型的视图
-(nullable __kindof UIView *)viewWithClass:
    (nonnull Class)typeClass;
//从视图层级中获取特定类型的所有视图
-(nullable NSArray<UIView *> *)viewsWithClass:
    (nonnull Class)typeClass;
//快速创建类名对应的xib视图
+(nonnull __kindof UIView *)xib;
//根据xib名称创建View对象
+(nonnull __kindof UIView *)xibWithName:(nonnull NSString *)name;
@end

@interface UIView (FFAutoLayout)
//使用布局系统推算宽度
@property(nonatomic,assign,readonly)
    CGFloat layoutWidth;
//使用布局系统推算高度
@property(nonatomic,assign,readonly)
    CGFloat layoutHeight;
//使用布局系统推算宽度和高度
@property(nonatomic,assign,readonly)
    CGSize layoutSize;
@end

@interface UIView (FFCommunication)
//view标记
@property(nonatomic,copy,nullable)
    IBInspectable NSString *viewName;
//数据传输属性
@property(nonatomic,strong,nullable)
    id viewData;
//View数据回调代理
@property(nonatomic,weak,nullable) IBOutlet
    id<FFBaseDelegateProtocol> viewDelegate;
//View数据传递事件发送方法
-(void)sendViewEvent:(nonnull NSString *)event
    data:(nullable id)data;
//统一的其他点击事件响应方法
- (IBAction)clickResponser:(nonnull id)sender;
@end
