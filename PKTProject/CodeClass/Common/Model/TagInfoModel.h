//
//  TagInfoModel.h
//  PKModel
//
//  Created by young on 15/5/27.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  TAG
 */
@interface TagInfoModel : NSObject
//    "tag_info": {
//        "tag": "",
//        "count": 0,
//        "offical": false
//    }

@property (nonatomic, strong) NSString *tag;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) BOOL offical;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)tagInfoWithDictionary:(NSDictionary *)dic;

@end
