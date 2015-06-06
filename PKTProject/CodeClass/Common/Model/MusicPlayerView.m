//
//  MusicPlayerView.m
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import "MusicPlayerView.h"

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
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(padding, 110, rect.size.width - padding * 2, rect.size.width - padding * 2)];
        [self addSubview:_imageView];
        
        CGRect imgVFrame = _imageView.frame;
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(padding, imgVFrame.origin.y + imgVFrame.size.height, imgVFrame.size.width, 50)];
        [self addSubview:_titleLabel];
        
        //LLView
        CGRect titleFrame = _titleLabel.frame;
        _modeLabel = [[UILabel alloc]initWithFrame:CGRectMake(padding, titleFrame.origin.y + titleFrame.size.height, titleFrame.size.width, 40)];
        [self addSubview:_modeLabel];
        
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
        _progressView.frame = CGRectMake(padding, _modeLabel.frame.origin.y + titleFrame.size.height, titleFrame.size.width, 40);
        [self addSubview:_progressView];
        
        UIButton *lastMusicBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [lastMusicBtn setTitle:@"上一首" forState:UIControlStateNormal];
        lastMusicBtn.backgroundColor = [UIColor redColor];
        lastMusicBtn.frame = CGRectMake(padding, rect.size.height - 49, (rect.size.width - padding * 2) / 3, 49);
        [self addSubview:lastMusicBtn];
        
        UIButton *playAndPauseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        playAndPauseBtn.frame = CGRectMake(lastMusicBtn.frame.origin.x + lastMusicBtn.frame.size.width, lastMusicBtn.frame.origin.y, lastMusicBtn.frame.size.width, 49);
        [lastMusicBtn setTitle:@"播放" forState:UIControlStateNormal];
        lastMusicBtn.backgroundColor = [UIColor blueColor];
        [self addSubview:playAndPauseBtn];
    }
    return self;
}



@end
