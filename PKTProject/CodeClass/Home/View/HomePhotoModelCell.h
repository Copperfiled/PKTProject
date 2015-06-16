//
//  HomePhotoModelCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseCell.h"

@interface HomePhotoModelCell : BaseCell

@property (nonatomic, readonly, strong) UIImageView *coverImgView;
@property (nonatomic, readonly, strong) UIImageView *leftImgView;
@property (nonatomic, readonly, strong) UIImageView *rightImgView;
@property (nonatomic, readonly, strong) UILabel *countLabel;
@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UILabel *contentLabel;
@property (nonatomic, readonly, strong) UILabel *likeLabel;

@end
