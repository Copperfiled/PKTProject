//
//  GroupListModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

/**
 *  小组列表
 */


@interface GroupListModel : NSObject

@property (nonatomic, strong) NSString *coverimg;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *groupid;
@property (nonatomic, strong) NSString *lastupdate_f;
@property (nonatomic, strong) NSNumber *membernum;

@property (nonatomic, strong) UserInfoModel *userinfo;
@property (nonatomic, strong) NSArray *tags; //NSString
@property (nonatomic, strong) NSArray  *latestposts;//TopicSketchModel

@end
