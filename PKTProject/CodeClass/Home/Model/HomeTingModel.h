//
//  HomeTingModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"

@class UserInfoModel;
@class PlayInfoModel;

@interface HomeTingModel : BaseModel

@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSNumber *hot;
//@property (nonatomic, strong) NSString *ID;
@property (nonatomic, assign) BOOL issend;
//@property (nonatomic, assign) NSNumber *type;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *enname;
@property (nonatomic, assign) BOOL *islike;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSNumber *view;
@property (nonatomic, strong) NSNumber *like;
@property (nonatomic, strong) NSString *ting_contentid;

@property (nonatomic, strong) NSMutableArray *playList;

@property (nonatomic, strong) UserInfoModel *userinfo;
@property (nonatomic, strong) PlayInfoModel *playInfo;


@end
