//
//  TopicListTableViewCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopicContentView;
@class LLCustomView;
@class GroupTopicListModel;

@interface TopicListTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) TopicContentView *topicView;
@property (nonatomic, strong) LLCustomView *bottomLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(GroupTopicListModel *)model;

@end
