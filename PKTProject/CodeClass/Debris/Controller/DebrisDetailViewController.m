//
//  DebrisDetailViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/2.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "DebrisDetailViewController.h"
//#import "PKTRequestManager.h"
#import "UserInfoView.h"
#import "DebrisDetailModel.h"

@interface DebrisDetailViewController ()<UIWebViewDelegate, UserInfoViewDelegate>

@property (nonatomic, strong) UserInfoView *userInfoView;
@property (nonatomic, strong) UIWebView *infoWebView;

@end

@implementation DebrisDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"碎片详情";
    _infoWebView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _infoWebView.delegate = self;
    
    [self.view addSubview:_infoWebView];
    
    _userInfoView = [[UserInfoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    _userInfoView.backgroundColor = [UIColor whiteColor];
    _userInfoView.delegate = self;
    [self.view addSubview:_userInfoView];
}

#pragma mark - UserInfoView delegate -
- (void)tapOnUserInfoViewIconAction:(NSString *)uid
{
    NSLog(@"user id = %@", uid);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setContentid:(NSString *)contentid
{
    [PKTRequestManager postRequestWithURL:API_TIMELINE_INFO paramters:@{@"contentid":contentid} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *dataDic = [dic valueForKey:@"data"];
        
        DebrisDetailModel *detailModel = [DebrisDetailModel new];
        [detailModel setValuesForKeysWithDictionary:dataDic];
        
        [detailModel.userInfo setValuesForKeysWithDictionary:[dataDic valueForKey:@"userinfo"]];
        [detailModel.shareInfo setValuesForKeysWithDictionary:[dataDic valueForKey:@"shareinfo"]];
//        [detailModel.counterList setValuesForKeysWithDictionary:[dataDic valueForKey:@"counterList"]];
        [_userInfoView setUserInfoModel:detailModel.userInfo time:[dataDic valueForKey:@"addtime_f"]];
        
        NSURL *url = [NSURL URLWithString:detailModel.shareInfo.url];
        [_infoWebView loadRequest:[NSURLRequest requestWithURL:url]];
    }];
}
#pragma mark - web View delegate -
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"web start");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"web view finish load");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"web view error : %@", error);
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
