//
//  UserDetailTableViewController.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "UserDetailTableViewController.h"
#import "UserDetailHeaderView.h"

#import "UserDetailInfoModel.h"

@interface UserDetailTableViewController ()

- (void)requestData;

@end

@implementation UserDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _userDetailModel = [UserDetailInfoModel new];
    
    _debriTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView = _debriTableView;
//    self.tableView.contentInset = UIEdgeInsetsMake(120, 0, 0, 0);
    
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - request data -

- (void)requestData
{
    [PKTRequestManager postRequestWithURL:API_PROFILE_INFO paramters:@{@"uid":_uid} finshedBlock:^(id dataResponse) {
        NSDictionary *dic = dataResponse;
        NSDictionary *dataDic = dic[@"data"];
        
        _userDetailModel = [UserDetailInfoModel userDetailWithDictionary:dataDic[@"userinfo"]];
        
        _debriArray = dataDic[@"list"];
        [self.debriTableView  reloadData];
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
    if (tableView == _debriTableView) {
        return _debriArray.count;
    }
    else
    {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idf = @"idf";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idf];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idf];
    }
    // Configure the cell...
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    _headerView = [[UserDetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120) model:_userDetailModel];
    
    _headerView.contentMode = UIViewContentModeScaleAspectFill;
    
//    view.uid = _uid;
//    view.userDetailModel = _userDetailModel;
    _headerView.backgroundColor = [UIColor clearColor];
    [headerView addSubview:_headerView];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    CGFloat y = scrollView.contentOffset.y;
    if (y < -120) {
        CGRect frame = _headerView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        _headerView.frame = frame;
    }
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
