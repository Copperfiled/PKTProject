//
//  TagInfoModel.m
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "TagInfoModel.h"

@implementation TagInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)tagInfoWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

@end
