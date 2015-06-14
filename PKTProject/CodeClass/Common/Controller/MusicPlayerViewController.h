//
//  MusicPlayerViewController.h
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicPlayerView;
@class MusicInfoModel;

@interface MusicPlayerViewController : UIViewController

@property (nonatomic, strong) NSString *radioId;
@property (nonatomic, strong) NSString *songid;
@property (nonatomic, strong) NSMutableArray *musicArray;

@property (nonatomic, strong) MusicPlayerView *playerView;//音乐播放器视图
@property (nonatomic, strong) MusicInfoModel *musicInfoModel;//音乐信息模型


- (instancetype)initWithRaioId:(NSString *)radioId;
- (instancetype)initWithSongId:(NSString *)songId;

@end
