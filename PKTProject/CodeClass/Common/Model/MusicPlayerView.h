//
//  MusicPlayerView.h
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicInfoModel;

@interface MusicPlayerView : UIView

//视图控件
@property (nonatomic, readonly, strong) UIImageView *imageView;
@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UILabel *modeLabel;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, readonly, strong) UIProgressView *progressView;

//控制按钮控件
@property (nonatomic, readonly, strong) UIButton *lastMusicBtn;
@property (nonatomic, readonly, strong) UIButton *playAndPauseBtn;
@property (nonatomic, readonly, strong) UIButton *nextMusicBtn;

//数据源
@property (nonatomic, strong) NSMutableArray *musicModelArray;
@property (nonatomic, strong) NSMutableArray *musicUrlArray;
@property (nonatomic, strong) MusicInfoModel *musicInfoMode;


- (instancetype)initWithFrame:(CGRect)frame;

//添加数据模型
- (void)setMusicInfoMode:(MusicInfoModel *)musicInfoMode;

@end
