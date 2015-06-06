//
//  UserDetailInfoModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetailInfoModel : NSObject

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) int gender;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSString *about_url;

//init
- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)userDetailWithDictionary:(NSDictionary *)dic;

@end
