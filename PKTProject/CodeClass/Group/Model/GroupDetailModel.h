//
//  GroupDetailModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoModel;

@interface GroupDetailModel : NSObject

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *groupid;
@property (nonatomic, strong) NSNumber *postsnum;
@property (nonatomic, strong) NSNumber *membernum;

@property (nonatomic, strong) UserInfoModel *userinfo;

@property (nonatomic, strong) NSString *lastupdate_f;

@property (nonatomic, assign) BOOL is_member;

@end
