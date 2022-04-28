//
//  FFXibRemLayoutView.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFXibRemLayoutView.h"

//根据屏幕宽度缩放（缩放基准尺寸为主流的375pt）
#define dd(s) (s*[UIScreen mainScreen].bounds.size.width/375.0)

//此组件对使用方式要求繁多，请仔细阅读和谨慎使用。
@implementation FFXibRemLayoutView

-(void)awakeFromNib {
    [super awakeFromNib];
    //注意：
    //rem容器组件（即FFRemContainerView）的相对约束不会生效
    //，所以建议容器组件的上下左右约束都应该为0
    //另外：
    //如果页面里某一部分希望用rem容器组件
    //，那么整个页面几乎都要用rem方式来，不然会出缩放就不正确。
    [self remChildrenWithSuper:self];
}

-(void)remChildrenWithSuper:(UIView *)view {
    //处理约束
    for (NSLayoutConstraint *cons
        in view.constraints) {
        cons.constant=dd(cons.constant);
    }
    //处理圆角
    if (view.layer.cornerRadius>=0) {
        view.layer.cornerRadius=
            dd(view.layer.cornerRadius);
    }
    //处理基础组件特定属性并递归容器组件
    if ([view isKindOfClass:UILabel.class]) {
        UILabel *label=(UILabel *)view;
        UIFont *fontSelf=label.font;
        UIFontDescriptor *fontDescriptor=
            fontSelf.fontDescriptor;
        label.font=[UIFont
            fontWithDescriptor:fontDescriptor
            size:dd(fontSelf.pointSize)];
    }
    else if ([view isKindOfClass:UITextField.class]) {
        UITextField *textField=(UITextField *)view;
    }
    else  if ([view isKindOfClass:UIButton.class]) {
        UIButton *button=(UIButton *)view;
    }
    else  if ([view isKindOfClass:UITextView.class]) {
        UITextView *textView=(UITextView *)view;
    }
    else if ([view isKindOfClass:UIScrollView.class]) {
        //由于此容器组件内部还包含指示器等默认组件
        //，所以不再递归处理。
        //如果内部的子组件还需要rem处理
        //，那就在UIScrollView里面建一个view作为内容根组件
        //，然后设置为rem容器组件。
    }
    else if ([view isKindOfClass:UITableView.class]) {
        //由于此容器组件内部还包含指示器等默认组件
        //，所以不再递归处理。
        //如果内部的cell组件还需要rem处理
        //，那就在xib的cell的content里面建一个view作为内容根组件
        //，然后设置为rem容器组件。
    }
    else if ([view isKindOfClass:UIStackView.class]) {
        //由于此容器组件内部不需要处理上下左右约束
        //，所以不再递归处理。
        //如果内部的子组件还需要rem处理
        //，那就将UIStackView里面的每个组件用UIView组件包起来
        //，然后设置其为rem容器组件。
    }
    else if ([view isKindOfClass:UIView.class]) {
        for (UIView *viewChild in view.subviews) {
            [self remChildrenWithSuper:viewChild];
        }
    }
}

@end
