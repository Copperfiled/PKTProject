//
//  MusicPlayerViewController.m
//  PKTAVEngine
//
//  Created by guanxiaobai on 15/6/5.
//  Copyright (c) 2015年 guanxiaobai. All rights reserved.
//

#import "MusicPlayerViewController.h"

#import "MusicPlayerManager.h"
#import "MusicPlayerView.h"

//model
#import "MusicInfoModel.h"

//其他
#import "MusicPlayerManager.h"

@interface MusicPlayerViewController ()

- (void)requestDataWithRadioId;

//音乐播放action
- (void)lastMusic;
- (void)playAndPauseMusic;
- (void)nextMusic;

@end

@implementation MusicPlayerViewController

//初始化音乐或者电台id
- (instancetype)initWithRaioId:(NSString *)radioId
{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    self = [super init];
    if (self) {
        _radioId = radioId;
    }
    return self;
}
- (instancetype)initWithSongId:(NSString *)songId
{
    self = [super init];
    if (self) {
        _songid = songId;
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _playerView = [[MusicPlayerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_playerView];
    //添加播放歌曲信息model
    [_playerView setMusicInfoMode:_musicInfoModel];
    [_playerView.lastMusicBtn addTarget:self action:@selector(lastMusic) forControlEvents:UIControlEventTouchUpInside];
    [_playerView.playAndPauseBtn addTarget:self action:@selector(playAndPauseMusic) forControlEvents:UIControlEventTouchUpInside];
    [_playerView.nextMusicBtn addTarget:self action:@selector(nextMusic) forControlEvents:UIControlEventTouchUpInside];
    
    //初始化数据源
    _musicArray = [NSMutableArray new];
    [self requestDataWithRadioId];
}

- (void)requestDataWithRadioId
{
    [PKTRequestManager postRequestWithURL:API_RADIO_DETAIL paramters:@{@"radioid":_radioId} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *data = dic[@"data"];
        NSArray *array = data[@"list"];
        
        for (NSDictionary *dict in array) {
            //得到MusicInfo
            MusicInfoModel *model = [MusicInfoModel new];
            [model setValuesForKeysWithDictionary:dict];
            [_musicArray addObject:model];
            
#warning 这里还应该模型化userInfo等子model，暂时用不到，出现类似错误可在这里查找
        }
        
        //为音乐模型数组赋值，方便将音乐数组传给音乐播放器
        [_playerView setMusicModelArray:_musicArray];        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)lastMusic
{
    MusicPlayerManager *musicPlayer = [MusicPlayerManager shareMusicPlayerManager];
    [musicPlayer lastMusic];
}

- (void)playAndPauseMusic
{
    MusicPlayerManager *musicPlayer = [MusicPlayerManager shareMusicPlayerManager];
    if (musicPlayer.playState == PlayStateStarted) {
        [musicPlayer pause];
        [_playerView.playAndPauseBtn setTitle:@"播放" forState:UIControlStateNormal];
    }
    else if (musicPlayer.playState == PlayStatePause)
    {
        [musicPlayer start];
        [_playerView.playAndPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    }
}
- (void)nextMusic
{
    MusicPlayerManager *musicPlayer = [MusicPlayerManager shareMusicPlayerManager];
    if (musicPlayer.playState == PlayStatePause || musicPlayer.playState == PlayStateStop) {
        //如果是暂停或停止状态，则应将playAndPause按钮修改为“暂停”
        [_playerView.playAndPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    }
    [musicPlayer nextMusic];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
