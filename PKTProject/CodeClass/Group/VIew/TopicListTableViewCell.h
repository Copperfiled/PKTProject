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
@property (nonatomic, strong) GroupTopicListModel *topicListModel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setTopicListModel:(GroupTopicListModel *)topicListModel reuseIdentifier:(NSString *)reuseIdentifier;

@end
