//
//  UserInfoView.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/2.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "UserInfoView.h"

#import "UIImageView+WebCache.h"
#import "UserInfoModel.h"

@implementation UserInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置头像
        _headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
        _headImgView.layer.masksToBounds = YES;
        _headImgView.layer.cornerRadius = 30;
        _headImgView.userInteractionEnabled = YES;
//        _headImgView.backgroundColor = [UIColor blueColor];
        [self addSubview:_headImgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnIconAction:)];
        [_headImgView addGestureRecognizer:tap];
        
        //设置姓名
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 200, 40)];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.userInteractionEnabled = YES;
//        _nameLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_nameLabel];
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnIconAction:)];
        [_nameLabel addGestureRecognizer:tap1];
        //设置时间
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 100 - 20, 30, 100, 40)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:_timeLabel];
    }
    return self;
}
#pragma mark - tap action
- (void)tapOnIconAction:(UITapGestureRecognizer *)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(tapOnUserInfoViewIconAction:)]) {
        [_delegate tapOnUserInfoViewIconAction:_userInfoModel.uid];
    }
}
- (void)setUserInfoModel:(UserInfoModel *)userInfoModel time:(NSString *)time
{
    _userInfoModel = userInfoModel;
    [_headImgView sd_setImageWithURL:[NSURL URLWithString:userInfoModel.icon]];
    _nameLabel.text = userInfoModel.uname;
    _timeLabel.text = time;
}

@end
