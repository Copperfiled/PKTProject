//
//  DebrisListModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "CounterListModel.h"
#import "TagInfoModel.h"


/**
 *  碎片列表模型
 */

@interface DebrisListModel : NSObject

@property (nonatomic, strong) NSString *contentid;
@property (nonatomic, strong) NSDate   *addtime;
@property (nonatomic, strong) NSString *addtime_f;
@property (nonatomic, strong) NSString *songid;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSString *coverimg_wh;
@property (nonatomic, assign) BOOL     islike;

@property (nonatomic, strong) UserInfoModel    *userinfo;//用户信息
@property (nonatomic, strong) CounterListModel *counterList;//评论信息
@property (nonatomic, strong) TagInfoModel     *taginfo;//标签信息



@end
