//
//  UserInfoView.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/2.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserInfoModel;

@protocol UserInfoViewDelegate <NSObject>

- (void)tapOnUserInfoViewIconAction:(NSString *)uid;

@end

@interface UserInfoView : UIView

@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UserInfoModel *userInfoModel;

@property (nonatomic, assign) id<UserInfoViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)setUserInfoModel:(UserInfoModel *)userInfoModel time:(NSString *)time;


@end
