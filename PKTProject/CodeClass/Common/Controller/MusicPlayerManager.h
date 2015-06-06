//
//  MusicPlayerManager.h
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import <Foundation/Foundation.h>

//播放模式
typedef NS_ENUM(NSInteger, PlayModel)
{
    PlayModelListCycle, //顺序循环播放
    PlayModelSingleCycle,//单曲循环
    PlayModelRandom //随机播放
};

//播放器状态
typedef NS_ENUM(NSInteger, PlayState)
{
    PlayStateStarted,//已开启播放
    PlayStatePause,//暂停
    PlayStateStop//停止
};

@interface MusicPlayerManager : NSObject

@property (nonatomic, assign) PlayModel playMode; //播放模式
@property (nonatomic, readonly, assign) PlayState playState; //播放器状态

@property (nonatomic, readonly, assign) double currentTime; //当前时间
@property (nonatomic, readonly, assign) double totalTime; //总运行时间
@property (nonatomic, readonly, assign) double bufferTime; //已缓冲时间

@property (nonatomic, strong) NSMutableArray *musicUrlArray;

//开启与关闭
- (void)start; //开始播放
- (void)pause; //暂停播放
- (void)stop;  //停止播放

- (void)nextMusic; //下一曲
- (void)lastMusic; //上一曲

//随机播放一首音乐
- (void)playMusicWithIndex:(NSInteger)index;

//根据时间跳转到某一进度
- (void)seekToTime:(double)newSeekTime;

//单例
+ (instancetype)shareMusicPlayerManager;

- (void)setMusicUrlArray:(NSMutableArray *)musicUrlArray;

@end
