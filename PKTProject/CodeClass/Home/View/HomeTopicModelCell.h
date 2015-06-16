//
//  HomeTopicModelCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseCell.h"

@interface HomeTopicModelCell : BaseCell

#warning 这里可以写在BaseCell里面,在这里可以重写initWithStyle方法

@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UIImageView *coverImgView;
@property (nonatomic, readonly, strong) UILabel *contentLabel;

@property (nonatomic, readonly, strong) UILabel *likeLabel;

@end
