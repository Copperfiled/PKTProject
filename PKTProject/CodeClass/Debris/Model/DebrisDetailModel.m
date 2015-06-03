//
//  DebrisDetailModel.m
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "DebrisDetailModel.h"

@implementation DebrisDetailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userInfo = [UserInfoModel new];
        _counterList = [CounterListModel new];
        _shareInfo = [ShareInfoModel new];
        _tagInfo = [TagInfoModel new];
    }
    return self;
}
@end
