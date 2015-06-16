//
//  MusicPlayerManager.m
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import "MusicPlayerManager.h"

#import <AVFoundation/AVFoundation.h>

@implementation MusicPlayerManager {
    AVPlayer *_AVPlayer; //播放器
    AVPlayerItem *_AVPlayerItem; //用于观察播放器的状态(某一个音乐)
    NSInteger _musicIndex;  //音乐索引
}

+ (instancetype)shareMusicPlayerManager
{
    static MusicPlayerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

- (void)setMusicUrlArray:(NSMutableArray *)musicUrlArray
{
    if (!_musicUrlArray) {
        _musicUrlArray = musicUrlArray;
        
        //默认播放第0个
        _musicIndex = 0;
        //默认顺序呢播放
        _playMode = PlayModelListCycle;
        //默认为停止状态
        _playState = PlayStateStop;
        
        NSString *musicItem = _musicUrlArray[0];
        //初始化item
        _AVPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:musicItem]];
        //使用item初始化播放器
        _AVPlayer = [[AVPlayer alloc]initWithPlayerItem:_AVPlayerItem];
        
        //默认播放第一首歌曲
        [self start];
    }
}
//开启与关闭
- (void)start
{
//    if (_playState != PlayStateStarted) {
        //如果未开启，则开始播放，播放器状态改为正在播放
        [_AVPlayer play];
        NSLog(@"music play!");
        _playState = PlayStateStarted;
//    }
}

- (void)pause
{
    if (_playState == PlayStateStarted) {
        //如果播放器正在播放，则暂停, 并且将播放器状态改为暂停
        [_AVPlayer pause];
        _playState = PlayStatePause;
    }
//    [_AVPlayer pause];
}

- (void)stop
{
    if (_playState != PlayStateStop) {
        //如果播放器未停止，则停止播放.也即是，将播放时间归零，并停止播放
        [self seekToTime:0.0];
        [_AVPlayer pause];
    }
}
- (void)seekToTime:(double)newSeekTime
{
    //通过player 获取当前的cmtime
    //传入新的currentTime的double值，通过转变成现在的cmtime
    
    CMTime ctime = _AVPlayer.currentTime;
    ctime.value = ctime.timescale * newSeekTime;
    [_AVPlayer seekToTime:ctime];
}

- (void)nextMusic
{
    NSInteger count = _musicUrlArray.count;
    
    switch (_playMode) {
        case PlayModelRandom:
            //随机播放
            _musicIndex = arc4random() % count;
            break;
        case PlayModelListCycle:
        {
            _musicIndex++;
            if (_musicIndex >= count) {
                //如果是最后一首歌，播完后播放第一首歌
                _musicIndex = 0;
            }
            break;
        }
        case PlayModelSingleCycle:
        {
            //单曲循环, 暂时设为与顺序播放相同
            _musicIndex++;
            if (_musicIndex >= count) {
                //如果是最后一首歌，播完后播放第一首歌
                _musicIndex = 0;
            }
            break;
        }
        default:
            break;
    }
//    _musicIndex++;
    [self playMusicWithIndex:_musicIndex];
}

- (void)lastMusic
{
    switch (_playMode) {
        case PlayModelRandom:
        {
            _musicIndex = arc4random() % _musicUrlArray.count;
        }
            break;
            
        default:
        {
            _musicIndex--;
            if (_musicIndex < 0) {
                _musicIndex = _musicUrlArray.count - 1;
            }
        }
            break;
    }
    _musicIndex--;
    [self playMusicWithIndex:_musicIndex];
}
- (void)playMusicWithIndex:(NSInteger)index
{
    if (index >= 0 && index <= _musicUrlArray.count) {
        NSString *musicItem = _musicUrlArray[index];
        _AVPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:musicItem]];
        _AVPlayer = [[AVPlayer alloc]initWithPlayerItem:_AVPlayerItem];
        [self start];
    }
    else NSLog(@"下标错误");
}


@end
