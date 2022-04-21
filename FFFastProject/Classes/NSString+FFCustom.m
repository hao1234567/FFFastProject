//
//  NSString+FFCustom.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "NSString+FFCustom.h"
#import <objc/runtime.h>
//Need to import for CC_MD5 access
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (FFCustom)

-(NSString *)md5Bit32
{
    const char *cStr=[self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr,(CC_LONG)self.length,digest);
    NSMutableString *result=[NSMutableString
        stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i=0;i<CC_MD5_DIGEST_LENGTH;i++)
        [result appendFormat:@"%02x",digest[i]];
    return result;
}

-(NSString *)toCapitalNumber {
    NSArray *arrArabicNumerals=@[
        @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"
    ];
    NSArray *arrChineseNumerals=@[
        @"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"
    ];
    NSArray *arrDigits=@[
        @"个",@"十",@"百",@"千",@"万",
        @"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"
    ];
    NSDictionary *dictMapping=[NSDictionary
        dictionaryWithObjects:arrChineseNumerals
        forKeys:arrArabicNumerals];
    NSMutableArray *arrResult=
        [NSMutableArray array];
    for (int i=0;i<self.length;i++) {
        NSString *strItem=
            [self substringWithRange:NSMakeRange(i,1)];
        NSString *a=[dictMapping objectForKey:strItem];
        NSString *b=arrDigits[self.length-i-1];
        NSString *strSum=[a stringByAppendingString:b];
        if ([a isEqualToString:arrChineseNumerals[9]]) {
            if([b isEqualToString:arrDigits[4]]||
                [b isEqualToString:arrDigits[8]]) {
                strSum=b;
                if ([[arrResult lastObject]
                    isEqualToString:arrChineseNumerals[9]]) {
                    [arrResult removeLastObject];
                }
            } else {
                strSum=arrChineseNumerals[9];
            }
            if ([[arrResult lastObject]
                isEqualToString:strSum]) {
                continue;
            }
        }
        [arrResult addObject:strSum];
    }
    NSString *strResult=
        [arrResult componentsJoinedByString:@""];
    NSString *strChinese=
        [strResult substringToIndex:strResult.length-1];
    return strChinese;
}

-(NSDictionary *)toJSONDictionary
{
    NSData *dataJson=[self
        dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dictData=[NSJSONSerialization
        JSONObjectWithData:dataJson
        options:NSJSONReadingMutableContainers
        error:&error];
    return dictData;
}

-(NSString *)getPinYin {
    NSMutableString *stringResult=
        [NSMutableString stringWithString:self];
    CFStringTransform(
        (CFMutableStringRef)stringResult,
        NULL, kCFStringTransformToLatin, false);
    stringResult=(NSMutableString *)[stringResult
        stringByFoldingWithOptions:NSDiacriticInsensitiveSearch
        locale:[NSLocale currentLocale]];
    return [stringResult stringByReplacingOccurrencesOfString:@"'" withString:@""];
}

-(NSArray *)split:(NSString *)separator
{
    if(![NSString hasValue:self])
        return ([NSMutableArray new]);
    NSMutableArray *arrResult=
        [NSMutableArray new];
    NSArray *arrTemp=
        [self componentsSeparatedByString:separator];
    for (NSString *strContent in arrTemp) {
        [arrResult addObject:strContent];
    }
    return arrResult;
}

+(BOOL)isNil:(NSString *)text
{
    return text==nil;
}

+(BOOL)isEmpty:(NSString *)text
{
    return [text isEqualToString:@""];
}

+(BOOL)hasValue:(NSString *)text
{
    return ![NSString isNil:text]&&
        ![NSString isEmpty:text];
}
@end

@implementation NSString (FFCustomDate)

-(NSString *)dateFormat
{
    NSString *strFormat=
        objc_getAssociatedObject(self, _cmd);
    if (![NSString hasValue:strFormat]) {
        strFormat=@"yyyy-MM-dd HH:mm:ss";
    }
    return strFormat;
}

-(void)setDateFormat:(NSString *)dateFormat
{
    objc_setAssociatedObject(self,
        @selector(dateFormat),
        dateFormat, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSDate *)toBeijingDate
{
    NSDateFormatter *formatter=
        [[NSDateFormatter alloc] init];
    [formatter setDateFormat:self.dateFormat];
    //[NSTimeZone systemTimeZone]
    //[NSTimeZone knownTimeZoneNames]
    formatter.timeZone=[NSTimeZone
        timeZoneWithName:@"Asia/Shanghai"];
    NSDate *dateTime=[formatter dateFromString:self];
    return dateTime;
}

@end
