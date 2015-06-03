//
//  GroupTopicListModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfoModel;
@class CounterListModel;

@interface GroupTopicListModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *contentid;
@property (nonatomic, strong) NSString *addtime_f;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSString *songid;

@property (nonatomic, assign) BOOL isrecommend;
@property (nonatomic, assign) BOOL ishot;

@property (nonatomic, strong) UserInfoModel *userinfo;
@property (nonatomic, strong) CounterListModel *counterList;

@end
