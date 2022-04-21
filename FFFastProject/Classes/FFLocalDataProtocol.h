//
//  FFLocalDataProtocol.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FFLocalDataProtocol <NSObject>
//获取本地数据
-(void)getLocalData:(NSString *)key;
//设置本地数据
-(void)setLocalData:(NSString *)data key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
