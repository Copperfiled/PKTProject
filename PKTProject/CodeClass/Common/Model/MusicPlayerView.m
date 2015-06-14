//
//  MusicPlayerView.m
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import "MusicPlayerView.h"

//数据模型类库
#import "MusicInfoModel.h"

//第三方类库
#import "UIImageView+WebCache.h"

//其他
#import "MusicPlayerManager.h"

@implementation MusicPlayerView

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
        int padding = 45;
        CGRect rect = [UIScreen mainScreen].bounds;
        //设置imageView
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(padding, 20, rect.size.width - padding * 2, rect.size.width - padding * 2)];
//        _imageView.backgroundColor = [UIColor redColor];
        [self addSubview:_imageView];
        
        CGRect imgVFrame = _imageView.frame;
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(padding, imgVFrame.origin.y + imgVFrame.size.height, imgVFrame.size.width, 50)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
//        _titleLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:_titleLabel];
        
        //LLView
        CGRect titleFrame = _titleLabel.frame;
        _modeLabel = [[UILabel alloc]initWithFrame:CGRectMake(padding, titleFrame.origin.y + titleFrame.size.height, titleFrame.size.width, 40)];
        [self addSubview:_modeLabel];
        _modeLabel.backgroundColor = [UIColor blueColor];
        
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(padding, _modeLabel.frame.origin.y + titleFrame.size.height, titleFrame.size.width, 40);
        _progressView.tintColor = [UIColor blueColor];
        _progressView.backgroundColor = [UIColor grayColor];
        [self addSubview:_progressView];
        
        _lastMusicBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_lastMusicBtn setTitle:@"上一首" forState:UIControlStateNormal];
        _lastMusicBtn.backgroundColor = [UIColor redColor];
        _lastMusicBtn.frame = CGRectMake(padding, rect.size.height - 64 - 49 * 2, (rect.size.width - padding * 2) / 3, 49);
        [self addSubview:_lastMusicBtn];
        
        _playAndPauseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _playAndPauseBtn.frame = CGRectMake(_lastMusicBtn.frame.origin.x + _lastMusicBtn.frame.size.width, _lastMusicBtn.frame.origin.y, _lastMusicBtn.frame.size.width, 49);
        [_playAndPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
        _playAndPauseBtn.backgroundColor = [UIColor blueColor];
        [self addSubview:_playAndPauseBtn];
        
        _nextMusicBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_nextMusicBtn setTitle:@"下一首" forState:UIControlStateNormal];
        _nextMusicBtn.backgroundColor = [UIColor redColor];
        _nextMusicBtn.frame = CGRectMake(_playAndPauseBtn.frame.origin.x + _playAndPauseBtn.frame.size.width, rect.size.height - 64 - 49 * 2, (rect.size.width - padding * 2) / 3, 49);
        [self addSubview:_nextMusicBtn];
    }
    return self;
}

- (void)setMusicInfoMode:(MusicInfoModel *)musicInfoMode
{
    if (_musicInfoMode != musicInfoMode) {
        
        //添加图片
        [_imageView sd_setImageWithURL:[NSURL URLWithString:musicInfoMode.coverimg]];
        //添加标题
        _titleLabel.text = musicInfoMode.title;        
        
    }
}

- (void)setMusicModelArray:(NSMutableArray *)musicModelArray
{
    if (_musicModelArray != musicModelArray) {
        //赋值给音乐模型数组
        _musicModelArray = musicModelArray;
        
        //初始化音乐URL数组
        _musicUrlArray = [NSMutableArray new];
        for (MusicInfoModel *model in musicModelArray) {
            //添加musicUrl
            [_musicUrlArray addObject:model.musicUrl];
        }
        
        //初始化音乐播放器
        MusicPlayerManager *musicPlayer = [MusicPlayerManager shareMusicPlayerManager];
        [musicPlayer setMusicUrlArray:_musicUrlArray];
    }
}

@end
