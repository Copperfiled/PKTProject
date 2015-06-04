//
//  GroupInfoTableViewController.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupInfoModel;

@interface GroupInfoTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *postslistArray;
@property (nonatomic, strong) GroupInfoModel *groupInfoModel;
@property (nonatomic, strong) NSString *groupid;

@end
