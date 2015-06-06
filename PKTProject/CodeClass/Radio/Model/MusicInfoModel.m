//
//  MusicInfoModel.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "MusicInfoModel.h"

@implementation MusicInfoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //do something
}

- (id)valueForUndefinedKey:(NSString *)key
{
    //do something
    return nil;
}

//使用字典初始化我们的模型
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)musicInfoWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

@end
