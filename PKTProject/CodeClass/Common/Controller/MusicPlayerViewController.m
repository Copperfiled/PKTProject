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

@interface MusicPlayerViewController ()

- (void)requestData;

@end

@implementation MusicPlayerViewController

//初始化音乐或者电台id
- (instancetype)initWithRaioId:(NSString *)radioId
{
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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _playerView = [[MusicPlayerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_playerView];
}

- (void)requestDataWithRaioId
{
    [PKTRequestManager postRequestWithURL:API_RADIO_DETAIL paramters:@{@"radioid":_radioId} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *data = dic[@"data"];
        NSArray *musicArray = data[@"list"];
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
