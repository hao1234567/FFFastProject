//
//  FFHttpServiceProtocol.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FFHttpControllerProtocol;

@protocol FFHttpServiceProtocol <NSObject>
//展示层对象
@property(nonatomic,weak,nullable)
    id<FFHttpControllerProtocol> controller;
//发起数据服务的回调方法
-(void)service:(NSString *)tag
    param:(nullable NSDictionary *)form;
@end

NS_ASSUME_NONNULL_END
