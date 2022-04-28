//
//  NSMutableAttributedString+FFCustom.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "NSMutableAttributedString+FFCustom.h"

@implementation NSMutableAttributedString (FFCustom)

-(void)addString:(NSString *)string
{
    [self addString:string attributes:nil];
}

-(void)addString:(NSString *)string
    textFont:(UIFont *)font
{
    NSDictionary *dict=@{NSFontAttributeName:font};
    [self addString:string attributes:dict];
}

-(void)addString:(NSString *)string
    textColor:(UIColor *)color
{
    NSDictionary *dict=@{NSForegroundColorAttributeName:color};
    [self addString:string attributes:dict];
}

-(void)addString:(NSString *)string
    textFont:(UIFont *)font
    textColor:(UIColor *)color
{
    NSDictionary *dict=@{NSForegroundColorAttributeName:color
        ,NSFontAttributeName:font};
    [self addString:string attributes:dict];
}

-(void)addString:(NSString *)string
    attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs
{
    NSAttributedString *attrString=
        [[NSAttributedString alloc]
            initWithString:string attributes:attrs];
    [self appendAttributedString:attrString];
}

-(void)addAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs
{
    [self addAttributes:attrs range:NSMakeRange(0,self.length)];
}

@end
