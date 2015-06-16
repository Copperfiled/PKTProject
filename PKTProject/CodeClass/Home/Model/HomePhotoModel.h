//
//  HomePhotoModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"
/**
 * type = 4、17
 */
@class UserInfoModel;

@interface HomePhotoModel : BaseModel

@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, assign) NSNumber *hot;
//@property (nonatomic, strong) NSString *ID;
@property (nonatomic, assign) BOOL issend;
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

@property (nonatomic, strong) NSString *coverimg_wh;
@property (nonatomic, strong) NSNumber *imgwidth;
@property (nonatomic, strong) NSNumber *imgheight;

@property (nonatomic, strong) NSMutableArray *imglist;

@property (nonatomic, strong) NSNumber *imgtotal;

@end
