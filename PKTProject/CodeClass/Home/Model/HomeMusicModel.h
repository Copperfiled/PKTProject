//
//  HomeMusicModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"

@class UserInfoModel;

@interface HomeMusicModel : BaseModel  

@property (nonatomic, strong) NSString *coverimg; //封面
@property (nonatomic, strong) NSNumber *hot;//热度
//@property (nonatomic, strong) NSString *ID; //id
@property (nonatomic, assign) BOOL issend;  //是否发送
//@property (nonatomic, assign) NSNumber *type;//类型
@property (nonatomic, strong) NSString *date;//日期
@property (nonatomic, strong) NSString *name;//name
@property (nonatomic, strong) NSString *enname;//英文name
@property (nonatomic, assign) BOOL islike;//是否喜欢
@property (nonatomic, strong) NSString *title;//标题
@property (nonatomic, strong) NSString *content;//内容

@property (nonatomic, strong) NSNumber *view;//浏览人数
@property (nonatomic, strong) NSNumber *like;//喜欢人数

@property (nonatomic, strong) UserInfoModel *userinfo;//用户信息


@end
