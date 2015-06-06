//
//  ShareInfoModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  分享信息
 */

@interface ShareInfoModel : NSObject


@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)shareInfoWithDictionary:(NSDictionary *)dic;

@end
