//
//  UIView+Custom.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "UIView+Custom.h"
#import <objc/runtime.h>

//快速获取Xib里的Last视图
#define XIBLASTOBJ(name,xibOwner)\
    ([XIB(name,xibOwner,nil)lastObject])
//获取Xib里索引位置的视图
#define XIBOBJ(name,xibOwner,index)\
    (XIB(name,xibOwner,nil)[index])
//获取Xib里索引位置的视图
#define XIB(name,xibOwner,opt)\
    ([[NSBundle mainBundle]loadNibNamed:\
    name owner:xibOwner options:opt])

@implementation UIView (Custom)

-(CGFloat)layerRadius
{
    return self.layer.cornerRadius;
}

-(void)setLayerRadius:(CGFloat)layerRadius
{
    if (layerRadius<=0) {
        layerRadius=0;
    }
    if (layerRadius>0) {
        self.layer.masksToBounds=YES;
    }
    self.layer.cornerRadius=layerRadius;
}

-(CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth=borderWidth;
}

-(UIColor *)borderColor
{
    return [UIColor colorWithCGColor:
        self.layer.borderColor];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor=borderColor.CGColor;
}

-(BOOL)enableAutoresizing
{
    return self.autoresizingMask!=
        UIViewAutoresizingNone;
}

-(void)setEnableAutoresizing:(BOOL)enableAutoresizing
{
    if (!enableAutoresizing) {
        self.autoresizingMask=
            UIViewAutoresizingNone;
    }
    else {
        self.autoresizingMask=
            UIViewAutoresizingFlexibleWidth|
            UIViewAutoresizingFlexibleHeight;
    }
}

-(CGRect)frameInWindow
{
    return [self frameInView:self.window];
}

-(CGRect)frameInView:(UIView *)view
{
    return [self convertRect:self.bounds toView:view];
}

-(UIView *)viewWithClass:(Class)typeClass
{
    NSArray *arrAllViews=
        [self viewsWithClass:typeClass];
    if (arrAllViews.count>0) {
        return arrAllViews.firstObject;
    }
    return nil;
}

-(NSArray<UIView *> *)viewsWithClass:(Class)typeClass
{
    NSMutableArray *arrAllViews=
        [NSMutableArray new];
    [self getViewsWithClass:typeClass
        currentView:self arrViews:arrAllViews];
    return arrAllViews;
}

-(void)getViewsWithClass:(Class)typeClass
    currentView:(UIView *)viewCurrent
    arrViews:(NSMutableArray *)arrViews
{
    if ([viewCurrent isKindOfClass:typeClass]) {
        [arrViews addObject:viewCurrent];
    }
    for (UIView *viewItem in viewCurrent.subviews) {
        [self getViewsWithClass:typeClass
            currentView:viewItem arrViews:arrViews];
    }
}

+(UIView *)xib
{
    NSString *strSelfClass=
        NSStringFromClass(self.class);
    return XIBLASTOBJ(strSelfClass, nil);
}

+(UIView *)xibWithName:(NSString *)name
{
    return XIBLASTOBJ(name, nil);
}

@end

@implementation UIView (AutoLayout)

-(CGFloat)layoutWidth
{
    return self.layoutSize.width;
}

-(CGFloat)layoutHeight
{
    return self.layoutSize.height;
}

-(CGSize)layoutSize
{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    return [self systemLayoutSizeFittingSize:
            UILayoutFittingCompressedSize
        withHorizontalFittingPriority:
            UILayoutPriorityFittingSizeLevel
        verticalFittingPriority:
            UILayoutPriorityFittingSizeLevel];
}

@end

@interface  UIViewCommunicationTemp: NSObject
@property(nonatomic,weak)
    id<FFBaseDelegateProtocol> viewDelegate;
@end
@implementation UIViewCommunicationTemp
@end
@implementation UIView (Communication)

-(NSString *)viewName
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setViewName:(NSString *)viewName
{
    objc_setAssociatedObject(self,
        @selector(viewName),
        viewName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(id)viewData
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setViewData:(id)viewData
{
    objc_setAssociatedObject(self,
        @selector(viewData),
        viewData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<FFBaseDelegateProtocol>)viewDelegate
{
    return self.privateDelegate.viewDelegate;
}

-(void)setViewDelegate:(id<FFBaseDelegateProtocol>)viewDelegate
{
    if (!self.privateDelegate) {
        UIViewCommunicationTemp *temp=
            [UIViewCommunicationTemp new];
        self.privateDelegate=temp;
    }
    self.privateDelegate.viewDelegate=viewDelegate;
}

-(void)sendViewEvent:(NSString *)event data:(NSObject *)data
{
    if (self.viewDelegate&&[self.viewDelegate
        respondsToSelector:@selector(
            receiveTarget:event:data:)]) {
        [self.viewDelegate receiveTarget:self event:event data:data];
    }
}

-(void)clickResponser:(id)sender
{
    
}

-(UIViewCommunicationTemp *)privateDelegate
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setPrivateDelegate:
    (UIViewCommunicationTemp *)privateDelegate
{
    objc_setAssociatedObject(self,
        @selector(privateDelegate),
        privateDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
