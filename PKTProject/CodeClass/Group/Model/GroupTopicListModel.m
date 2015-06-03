//
//  GroupTopicListModel.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "GroupTopicListModel.h"

#import "UserInfoModel.h"
#import "CounterListModel.h"    

@implementation GroupTopicListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //
        _userinfo = [UserInfoModel new];
        _counterList = [CounterListModel new];
        
    }
    return self;
}

@end
