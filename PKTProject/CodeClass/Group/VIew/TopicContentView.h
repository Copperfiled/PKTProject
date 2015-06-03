//
//  TopicContentView.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupTopicListModel;

enum TopicContentViewType
{
    TopicContentViewText = 0,
    TopicContentViewImage = 1 << 0,
    TopicContentViewMusic = 1 << 1
};

@interface TopicContentView : UIView

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, assign) enum TopicContentViewType type;
@property (nonatomic, strong) GroupTopicListModel *topicListModel;

- (instancetype)initWithFrame:(CGRect)frame viewType:(enum TopicContentViewType)type;
- (void)setTopicListModel:(GroupTopicListModel *)topicListModel viewType:(enum TopicContentViewType)type;

@end
