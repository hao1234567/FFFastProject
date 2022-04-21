//
//  FFFastProjectConfig.m
//  FFFastProject
//
//  Created by TonyWang on 2022/4/17.
//  Copyright © 2022 TonyWang. All rights reserved.
//

#import "FFFastProjectConfig.h"

static FFFastProjectConfig *configFastProject;

@implementation FFFastProjectConfig

+(instancetype)sharedConfig
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configFastProject = [[self alloc] init];
    });
    return configFastProject;
}

@end
