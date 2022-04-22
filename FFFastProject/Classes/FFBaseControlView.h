//
//  FFBaseControlView.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFBaseControlView : UIView
//在父视图中展示
-(void)showInSuper:(nullable UIView *)viewSuper;
//在父视图中以指定frame展示
-(void)showInSuper:(nullable UIView *)viewSuper
    frame:(CGRect)rectView;
//统一的自定义视图自定义关闭方法
-(void)hiddenView;
@end
