//
//  RadioInfoModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoModel;

/**
 * 电台信息
 */

@interface RadioInfoModel : NSObject

@property (nonatomic, strong) NSString *radioid; //电台id
@property (nonatomic, strong) NSString *title; //电台标题
@property (nonatomic, strong) NSString *coverimg; //电台背景图片
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSNumber *musicvisitnum; //音乐播放次数
@property (nonatomic, assign) BOOL isnew;

@property (nonatomic, strong) UserInfoModel *userinfo;


@end
