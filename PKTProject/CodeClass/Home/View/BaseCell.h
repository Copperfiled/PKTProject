//
//  BaseCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseModel;

@interface BaseCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;

//数据源
@property (nonatomic, strong) BaseModel *baseModel;

- (void)setName:(NSString *)name withEnName:(NSString *)enName;

@end
