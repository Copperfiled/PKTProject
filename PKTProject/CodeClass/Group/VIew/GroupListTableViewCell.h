//
//  GroupListTableViewCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupListModel;

@interface GroupListTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(GroupListModel *)model;

@end
