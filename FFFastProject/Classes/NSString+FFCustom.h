//
//  NSString+FFCustom.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

//NSString扩展
@interface NSString (FFCustom)
//获取32位IOS平台MD5摘要
@property(nonatomic,copy,nonnull,readonly)
    NSString *md5Bit32;
//返回大写的中文数字
@property(nonatomic,copy,nullable,readonly)
    NSString *toCapitalNumber;
//获取json对应的字典对象
@property(nonatomic,strong,nullable,readonly)
    NSDictionary *toJSONDictionary;
//获取汉字对应的拼音(不带音标)
-(nullable NSString *)getPinYin;
//按分隔符拆分字符串
-(nonnull NSArray *)split:(nonnull NSString *)separator;
//判断字符串是否为null
+(BOOL)isNil:(nullable NSString *)text;
//判断字符串内容是否为空
+(BOOL)isEmpty:(nullable NSString *)text;
//判断字符串对象是否有内容
+(BOOL)hasValue:(nullable NSString *)text;
@end

//NSString时间转换扩展
@interface NSString (FFCustomDate)
//设置toBeijingDate的格式
@property(nonatomic,copy,nullable)
    NSString *dateFormat;
//将日期字符串转换为日期对象
@property(nonatomic,strong,nullable,readonly)
    NSDate *toBeijingDate;
@end
