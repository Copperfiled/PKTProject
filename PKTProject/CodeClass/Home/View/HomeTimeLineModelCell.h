//
//  HomeTimeLineModelCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/16.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "BaseCell.h"

@class LLCustomView;

@interface HomeTimeLineModelCell : BaseCell

@property (nonatomic, readonly, strong) UIImageView *coverImgView;
@property (nonatomic, readonly, strong) UILabel *contentLabel;
@property (nonatomic, readonly, strong) LLCustomView *tagAndLikeLabel;

@end
