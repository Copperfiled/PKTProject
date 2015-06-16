//
//  CellFactory.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "CellFactory.h"

#import "BaseModel.h"
#import "BaseCell.h"

@implementation CellFactory

+ (BaseCell *)cellForModel:(BaseModel *)model
{
    //得到model对应的类名
    NSString *className = [NSStringFromClass([model class]) stringByAppendingString:@"Cell"];
    
    //得到对应cell的类
    Class class = NSClassFromString(className);
    
    //根据类名分配cell空间，并且初始化
    //identifier为：model的类名
    BaseCell *cell = [[class alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([model class])];
    
    return cell;
}

@end
