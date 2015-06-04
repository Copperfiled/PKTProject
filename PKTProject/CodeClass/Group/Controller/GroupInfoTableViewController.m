//
//  GroupInfoTableViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "GroupInfoTableViewController.h"
#import "GroupDetailTableViewController.h"

#import "GroupInfoModel.h"
#import "GroupTopicListModel.h"
#import "UserInfoModel.h"
#import "CounterListModel.h"

#import "TopicListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+AllColor.h"
#import "LLCustomView.h"

@interface GroupInfoTableViewController ()

- (void)requestData;
- (void)joinBtnAction;
- (void)tapOnHeaderImgView;
@end

@implementation GroupInfoTableViewController

- (void)loadView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _postslistArray = [[NSMutableArray alloc]init];
    _groupInfoModel = [GroupInfoModel new];
//    [self.tableView registerClass:[TopicListTableViewCell class] forCellReuseIdentifier:@"reuse"];
//    self.tableView.style = UITableViewStyleGrouped;

    //请求数据
    [self requestData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - request data -

- (void)requestData
{
    [PKTRequestManager postRequestWithURL:API_GROUP_INFO paramters:@{@"groupid":_groupid} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *dataDic = [dic valueForKey:@"data"];
        //为模型赋值
        [_groupInfoModel setValuesForKeysWithDictionary:[dataDic valueForKey:@"groupinfo"]];
        
        NSArray *postList = [dataDic valueForKey:@"postslist"];
        for (NSDictionary *dict in postList) {
            GroupTopicListModel *model = [GroupTopicListModel new];
            [model setValuesForKeysWithDictionary:dict];
            model.userinfo = [UserInfoModel userInfoWithDictionary:[dict valueForKey:@"userinfo"]];
            model.counterList = [CounterListModel counterVithDictionary:[dict valueForKey:@"counterList"]];
            [_postslistArray addObject:model];
        }
        self.navigationItem.title = _groupInfoModel.title;
        [self.tableView reloadData];
    }];
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
    return _postslistArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 220;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 220)];
    UIImageView *bannerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    bannerImgView.userInteractionEnabled = YES;
    [bannerImgView sd_setImageWithURL:[NSURL URLWithString:_groupInfoModel.bannerimg]];
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnHeaderImgView)];
    [bannerImgView addGestureRecognizer:tap];
    [view addSubview:bannerImgView];
    LLCustomView *bottomLabel = [[LLCustomView alloc]initWithFrame:CGRectMake(0, 190, SCREEN_WIDTH - 100, 20)];
//    bottomLabel.leftLabel.backgroundColor = [UIColor blueColor];
//    bottomLabel.rightLabel.backgroundColor = [UIColor redColor];
    bottomLabel.leftLabel.font = [UIFont systemFontOfSize:12];
    bottomLabel.rightLabel.font = [UIFont systemFontOfSize:12];
    bottomLabel.rightLabel.textAlignment = NSTextAlignmentLeft;
    bottomLabel.leftLabel.text = [NSString stringWithFormat:@"成员:%@", _groupInfoModel.membernum];
    bottomLabel.rightLabel.text = [NSString stringWithFormat:@"话题:%@", _groupInfoModel.postsnum];
    [view addSubview:bottomLabel];
    
    UIButton *joinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    joinBtn.frame = CGRectMake(SCREEN_WIDTH - 80, 190, 50, 20);
    [joinBtn setTitle:@"加入" forState:UIControlStateNormal];
    joinBtn.backgroundColor = [UIColor cyanColor];
    joinBtn.layer.cornerRadius = 5;
    [joinBtn addTarget:self action:@selector(joinBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:joinBtn];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[TopicListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse" model:_postslistArray[indexPath.row]];
    }
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}
#pragma mark - actions -
- (void)joinBtnAction
{
    NSLog(@"groupid = %@", _groupid);
}
- (void)tapOnHeaderImgView
{
    //手势相应的方法
    GroupDetailTableViewController *detailVC = [GroupDetailTableViewController new];
    detailVC.groupid = _groupid;
    [self.navigationController pushViewController:detailVC animated:YES];
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
