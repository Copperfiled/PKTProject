//
//  CellFactory.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Cell 工厂
 * 根据所提供模型创建对应的cell
 *
 */

@class BaseModel;
@class BaseCell;

@interface CellFactory : NSObject

//根据model，返回对应的cell: model类名+Cell
+ (BaseCell *)cellForModel:(BaseModel *)model;

@end
