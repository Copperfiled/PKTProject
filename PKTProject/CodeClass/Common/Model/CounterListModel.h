//
//  CounterListModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  评论
 */
@interface CounterListModel : NSObject

//    "counterList": {
//        "comment": 0,
//        "like": 0
//    },

@property (nonatomic ,assign)int comment;//评论数
@property (nonatomic ,assign)int like;//喜欢数
@property (nonatomic ,assign)int view;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)counterVithDictionary:(NSDictionary *)dic;

@end
