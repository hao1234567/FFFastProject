//
//  UIButton+FFCustom.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "UIColor+FFCustom.h"

#define COLOR(r,g,b,p)\
    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:p]
#define RGB(r,g,b) COLOR(r,g,b,1)

@implementation UIColor (FFCustom)

+(UIColor *)initWithHex:(NSString *)hex
{
    //将str转换成十六进制数
    //去除#号,如果有
    NSRange range=[hex rangeOfString:@"#"];
    if (range.location != NSNotFound) {
        hex= [hex
         stringByReplacingCharactersInRange:
             range withString:@"0x"];
    }
    // 将十六进制字符串转成整型
    long colorLong = strtoul(
        [hex cStringUsingEncoding:
            NSUTF8StringEncoding], 0, 16);
    // 再通过位与方法获取三色值
    int R=(colorLong&0xFF0000)>>16;
    int G=(colorLong&0x00FF00 )>>8;
    int B=colorLong&0x0000FF;
    //将string转换成color
    return RGB(R, G, B);
}

@end
