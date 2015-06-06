//
//  RadioDetailTableViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "RadioDetailTableViewController.h"

//数据模型头文件
#import "MusicInfoModel.h"
#import "RadioInfoModel.h"
#import "PlayInfoModel.h"
#import "RadioInfoModel.h"
#import "UserInfoModel.h"
#import "ShareInfoModel.h"

//第三方库文件
#import "UIImageView+WebCache.h"

@interface RadioDetailTableViewController ()

- (void)requestData;//请求数据
- (void)topRefresh; //下拉刷新数据
- (void)bottomRefresh; //上拉加载数据

@end

@implementation RadioDetailTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style radioId:(NSString *)radioId
{
    self = [super initWithStyle:style];
    if (self) {
        _radioId = radioId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //初始化音乐数组
    _musicArray = [NSMutableArray new];
    
    //初始化电台信息
    _radioInfo = [RadioInfoModel new];
    
    //请求数据
    [self requestData];
}

#pragma mark 请求数据

- (void)requestData
{
    [PKTRequestManager postRequestWithURL:API_RADIO_DETAIL paramters:@{@"radioid":_radioId,@"start":@0,@"limit":@10} finshedBlock:^(id dataResponse) {
        //将得到的数据模型化
        NSDictionary *data = dataResponse[@"data"];
        NSArray *musicList = data[@"list"];
        
        //模型化电台信息
        [_radioInfo setValuesForKeysWithDictionary:data[@"radioInfo"]];
        _radioInfo.userinfo = [UserInfoModel userInfoWithDictionary:data[@"radioInfo"][@"userinfo"]];
        
        for (NSDictionary *dict in musicList) {
            MusicInfoModel *model = [MusicInfoModel new];
            [model setValuesForKeysWithDictionary:dict];
            
            //初始化model的playInfo属性
            model.playInfo = [PlayInfoModel playInfoWithDictionary:dict[@"playInfo"]];
            model.playInfo.userinfo = [UserInfoModel userInfoWithDictionary:dict[@"playInfo"][@"userinfo"]];
            model.playInfo.authorinfo = [UserInfoModel userInfoWithDictionary:dict[@"playInfo"][@"authorinfo"]];
            model.playInfo.shareinfo = [ShareInfoModel shareInfoWithDictionary:dict[@"playInfo"][@"shareinfo"]];
            [_musicArray addObject:model];
        }
        self.navigationItem.title = _radioInfo.title;
        //刷新视图
        [self.tableView reloadData];
    }];
}

- (void)topRefresh
{
    //下拉刷新
}
- (void)bottomRefresh
{
    //上拉加载
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _musicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idf = @"radioInfo";
    MusicInfoModel *model = _musicArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idf];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idf];
    }
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
    cell.textLabel.text = model.title;
    
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //返回头部高度
    return 200.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160.0)];
    UIImageView *coverImgView = [[UIImageView alloc]initWithFrame:view.frame];
    [coverImgView sd_setImageWithURL:[NSURL URLWithString:_radioInfo.coverimg]];
    [view addSubview:coverImgView];
    
    
    return view;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
