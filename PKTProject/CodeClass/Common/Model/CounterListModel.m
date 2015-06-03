//
//  CounterListModel.m
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "CounterListModel.h"

@implementation CounterListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)counterVithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

@end
