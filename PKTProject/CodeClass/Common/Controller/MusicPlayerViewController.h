//
//  MusicPlayerViewController.h
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicPlayerView;

@interface MusicPlayerViewController : UIViewController

@property (nonatomic, strong) NSString *radioId;
@property (nonatomic, strong) NSString *songid;
@property (nonatomic, strong) NSMutableArray *musicUrlArray;

@property (nonatomic, strong) MusicPlayerView *playerView;

- (instancetype)initWithRaioId:(NSString *)radioId;
- (instancetype)initWithSongId:(NSString *)songId;

@end
