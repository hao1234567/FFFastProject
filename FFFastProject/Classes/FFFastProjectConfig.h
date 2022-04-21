//
//  FFFastProjectConfig.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFFastProjectConfig : NSObject
//实例化方法（单例）
+(instancetype)sharedConfig;
//默认的加载组件class
@property(nonatomic,strong,nullable)
    Class defaultLoaingViewClass;
//默认的错误组件class
@property(nonatomic,strong,nullable)
    Class defaultErrorViewClass;
//默认的等待组件class
@property(nonatomic,strong,nullable)
    Class defaultWaitingViewClass;
//本地数据服务组件class
@property(nonatomic,strong,nullable)
    Class defaultLocalServiceClass;
//默认的http服务组件class
@property(nonatomic,strong,nullable)
    Class defaultHttpServiceClass;
//登录页面class
@property(nonatomic,strong,nullable)
    Class loginViewControllerClass;
@end

NS_ASSUME_NONNULL_END
