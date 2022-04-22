//
//  FFBaseBoomAlert.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFBaseControlView.h"

@interface FFBaseBoomAlert : FFBaseControlView
//弹窗内容部分（类似于UIAlert中间白色部分）
@property(nonatomic,weak,nullable) IBOutlet
    UIView *viewContent;
//关闭按钮事件响应方法
- (IBAction)clickCancel:(nonnull id)sender;
@end
