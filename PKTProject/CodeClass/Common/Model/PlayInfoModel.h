//
//  PlayInfoModel.h
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfo;
@class ShareInfo;

@interface PlayInfoModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *musicUrl;
@property (nonatomic, strong) NSString *tingid;

@property (nonatomic, strong) UserInfo *userinfo;
@property (nonatomic, strong) UserInfo *authorinfo;

@property (nonatomic, strong) NSString *webview_url;
@property (nonatomic, strong) NSString *ting_contentid;
@property (nonatomic, strong) NSString *sharepic;
@property (nonatomic, strong) NSString *sharetext;
@property (nonatomic, strong) NSString *shareurl;

@property (nonatomic, strong) ShareInfo *shareinfo;

@property (nonatomic, assign) BOOL isnew;

@end
