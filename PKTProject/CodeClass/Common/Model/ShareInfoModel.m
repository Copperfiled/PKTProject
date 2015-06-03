//
//  ShareInfoModel.m
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "ShareInfoModel.h"

@implementation ShareInfoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)shareInfoWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

@end
