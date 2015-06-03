//
//  UserInfoModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户信息
 */


@interface UserInfoModel : NSObject

//    "userinfo": {
//        "uid": 1593043,
//        "uname": "Ame酱",
//        "icon": "http://pkicon.b0.upaiyun.com/icon/043/1593043/3d8b3bbe036a4138072cfe31f783403d_50"
//    },

@property (nonatomic, strong) NSString *uid;//ID
@property (nonatomic, strong) NSString *uname;//姓名
@property (nonatomic, strong) NSString *icon;//头像

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)userInfoWithDictionary:(NSDictionary *)dic;

@end
