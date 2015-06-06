//
//  UserDetailHeaderView.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "UserDetailHeaderView.h"
#import "UIImageView+WebCache.h"
#import "ImageLabelView.h"

#import "UserDetailInfoModel.h"

@implementation UserDetailHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame model:(UserDetailInfoModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        _userDetailModel = model;
        //custom our view
        //设置背景图
        _coverImgView = [[UIImageView alloc]initWithFrame:frame];
        [_coverImgView sd_setImageWithURL:[NSURL URLWithString:_userDetailModel.coverimg]];
//        _coverImgView.backgroundColor = [UIColor grayColor];
//        _coverImgView.alpha = 1;
        [self addSubview:_coverImgView];
        
        //设置背景图上方的视图
        _imageLabelView = [[ImageLabelView alloc]initWithFrame:CGRectMake(40, 30, SCREEN_WIDTH - 60, 60) url:model.icon];
        
//        _imageLabelView.backgroundColor = [UIColor blueColor];
//        _imageLabelView.alpha = 0.5;
        _imageLabelView.imgView.layer.masksToBounds = YES;
        _imageLabelView.imgView.layer.cornerRadius = CGRectGetHeight(_imageLabelView.imgView.frame) / 2;
//        _imageLabelView.imgView.backgroundColor = [UIColor greenColor];
        
        //性别图标
        _iconLabelView = [[ImageLabelView alloc]initWithFrame:CGRectMake(0, 0, _imageLabelView.label.frame.size.width, 30) url:nil];
        _iconLabelView.imgView.layer.masksToBounds = YES;
        _iconLabelView.imgView.layer.cornerRadius = CGRectGetHeight(_iconLabelView.imgView.frame) / 2;
        _iconLabelView.label.text = model.uname;
        _iconLabelView.label.font = [UIFont boldSystemFontOfSize:17];
        _iconLabelView.label.textColor = [UIColor whiteColor];
//        _iconLabelView.backgroundColor = [UIColor greenColor];
        
        _descLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, _imageLabelView.label.frame.size.width, 40)];
//        _descLabel.backgroundColor = [UIColor yellowColor];
        _descLabel.textColor = [UIColor whiteColor];
        _descLabel.numberOfLines = 0;
        _descLabel.font = [UIFont boldSystemFontOfSize:13];
        _descLabel.text = model.desc;
        
        [_imageLabelView.label addSubview:_iconLabelView];
        [_imageLabelView.label addSubview:_descLabel];
        
        [self addSubview:_imageLabelView];
    }
    return self;
}


@end
