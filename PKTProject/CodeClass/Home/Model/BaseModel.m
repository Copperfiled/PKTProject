//
//  BaseModel.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"key = %@, value = %@", key, value);
    if ([key isEqualToString:@"id"]) {
        _ID = value;
        NSLog(@"_ID = %@", _ID);
    }
}
- (id)valueForUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        return [self valueForKey:@"ID"];
    }
    return nil;
}

@end
