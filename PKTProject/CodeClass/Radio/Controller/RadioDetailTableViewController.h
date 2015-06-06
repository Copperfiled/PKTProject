//
//  RadioDetailTableViewController.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadioInfoModel;

@interface RadioDetailTableViewController : UITableViewController

@property (nonatomic, strong) NSString *radioId;
@property (nonatomic, strong) NSMutableArray *musicArray;
@property (nonatomic, strong) RadioInfoModel *radioInfo;

- (instancetype)initWithStyle:(UITableViewStyle)style radioId:(NSString *)radioId;

@end
