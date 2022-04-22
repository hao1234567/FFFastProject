//
//  FFUserInfoProtocol.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FFUserInfoProtocol <NSObject>
//获取用户token
-(NSString *)getUserToken;
//设置用户token
-(void)setUserToken:(NSString *)userToken;
//获取用户id
-(NSString *)getUserId;
//设置用户id
-(void)setUserId:(NSString *)userId;
//删除用户相关信息（退出登录）
+(void)deleteUserInfo;
@end
