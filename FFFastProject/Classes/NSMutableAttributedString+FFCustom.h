//
//  NSMutableAttributedString+FFCustom.h
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (FFCustom)
//快速添加一个普通字符串
-(void)addString:(nonnull NSString *)string;
//快速添加一个富文本字符串(font)
-(void)addString:(nonnull NSString *)string
    textFont:(nullable UIFont *)font;
//快速添加一个富文本字符串(color)
-(void)addString:(nonnull NSString *)string
    textColor:(nullable UIColor *)color;
//快速添加一个富文本字符串(font/color)
-(void)addString:(nonnull NSString *)string
    textFont:(nullable UIFont *)font
    textColor:(nullable UIColor *)color;
//快速添加一个富文本字符串(attributes)
-(void)addString:(nonnull NSString *)string
    attributes:(nullable NSDictionary<NSAttributedStringKey,id> *)attrs;
//快速为现有的字符串添加统一的富文本标记
-(void)addAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)attrs;
@end
