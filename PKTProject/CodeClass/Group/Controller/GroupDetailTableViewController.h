//
//  GroupDetailTableViewController.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/4.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupDetailModel;

@interface GroupDetailTableViewController : UITableViewController

@property (nonatomic, strong) GroupDetailModel *groupDetailModel;
@property (nonatomic, strong) NSString *groupid;

@end
