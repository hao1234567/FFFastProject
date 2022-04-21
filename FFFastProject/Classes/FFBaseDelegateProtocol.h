//
//  FFBaseDelegateProtocol.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FFBaseDelegateProtocol <NSObject>
@optional
//通用Delegate事件和数据回调方法
-(void)receiveTarget:(nonnull id)target
    event:(nonnull NSString *)event
    data:(nullable id)data;
@end
NS_ASSUME_NONNULL_END
