//
//  HomeTopicModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"

@class UserInfoModel;

@interface HomeTopicModel : BaseModel

@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSNumber *hot;
//@property (nonatomic, strong) NSString *ID;
@property (nonatomic, assign) BOOL issend;
@property (nonatomic, strong) NSNumber *lastupdate;
//@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *enname;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSNumber *view;
@property (nonatomic, strong) NSNumber *like;

@property (nonatomic, strong) UserInfoModel *userinfo;

@end
