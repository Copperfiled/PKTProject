//
//  DebrisDetailModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "TagInfoModel.h"
#import "CounterListModel.h"
#import "ShareInfoModel.h"

/**
 *  碎片详情
 */

@interface DebrisDetailModel : NSObject

@property (nonatomic, strong) ShareInfoModel *shareInfo;
@property (nonatomic, strong) TagInfoModel   *tagInfo;
@property (nonatomic, strong) UserInfoModel  *userInfo;
@property (nonatomic, strong) CounterListModel *counterList;

@property (nonatomic, strong) NSString *songid;
@property (nonatomic, strong) NSString *contentid;
@property (nonatomic, strong) NSString *addtime_f;
@property (nonatomic, strong) NSString *html;

@property (nonatomic, assign) BOOL isfav;
@property (nonatomic, assign) BOOL islike;

@property (nonatomic, strong) NSArray *commentlist;
@property (nonatomic, strong) NSArray *imglist;




@end
