//
//  HomeListModelCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
//图片 + title + content

@class HomeListModel;
@class BaseModel;

@interface HomeListModelCell : BaseCell

@property (nonatomic, readonly, strong) UIImageView *coverImgView;//背景图
@property (nonatomic, readonly, strong) UILabel *titleLabel;//标题
@property (nonatomic, readonly, strong) UILabel *contentLabel;//内容
@property (nonatomic, readonly, strong) UILabel *likeLabel;//喜欢的人数

@end
