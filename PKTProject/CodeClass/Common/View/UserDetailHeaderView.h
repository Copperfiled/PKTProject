//
//  UserDetailHeaderView.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserDetailInfoModel;
@class ImageLabelView;

@interface UserDetailHeaderView : UIView

//@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) UserDetailInfoModel *userDetailModel;

@property (nonatomic, readonly, strong) UIImageView *coverImgView;
@property (nonatomic, readonly, strong) UIButton *followBtn;
@property (nonatomic, readonly, strong) ImageLabelView *imageLabelView;
@property (nonatomic, readonly, strong) UILabel *descLabel;
@property (nonatomic, readonly, strong) ImageLabelView *iconLabelView;

//@property (nonatomic, readonly, strong) UILabel *descLabel;

-(instancetype)initWithFrame:(CGRect)frame model:(UserDetailInfoModel *)model;

@end
