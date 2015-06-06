//
//  UserDetailInfoModel.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "UserDetailInfoModel.h"

@implementation UserDetailInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)userDetailWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

@end
