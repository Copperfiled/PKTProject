//
//  TopicListTableViewCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "TopicListTableViewCell.h"
#import "GroupTopicListModel.h"

#import "TopicContentView.h"
#import "LLCustomView.h"
#import "UserInfoModel.h"
#import "CounterListModel.h"

@implementation TopicListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = [UIColor cyanColor];
        //init our own cell
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH - 40, 50)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        [self.contentView addSubview:_titleLabel];
        
        if ([reuseIdentifier isEqualToString:@"imageIdf"]) {
            //text and image
            _topicView = [[TopicContentView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 80) viewType:TopicContentViewImage];
        } else if ([reuseIdentifier isEqualToString:@"textIdf"])
        {
            _topicView = [[TopicContentView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 80) viewType:TopicContentViewText];
        }
        else {
            _topicView = [[TopicContentView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 80) viewType:TopicContentViewMusic];
        }
//        [_topicView setTopicListModel:model viewType:<#(enum TopicContentViewType)#>];
        [self.contentView addSubview:_topicView];
        
        _bottomLabel = [[LLCustomView alloc]initWithFrame:CGRectMake(20, 130, SCREEN_WIDTH - 40, 20)];
        
        _bottomLabel.leftLabel.font = [UIFont systemFontOfSize:12];
        _bottomLabel.leftLabel.textColor = [UIColor grayColor];
        
        _bottomLabel.rightLabel.font = [UIFont systemFontOfSize:12];
        _bottomLabel.rightLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_bottomLabel];
    }
    return self;
}

- (void)setTopicListModel:(GroupTopicListModel *)topicListModel reuseIdentifier:(NSString *)reuseIdentifier
{
    _topicListModel = topicListModel;
    //添加数据
    //title
    _titleLabel.text = _topicListModel.title;
    
    //topicView
    if ([reuseIdentifier isEqualToString:@"imageIdf"]) {
        [_topicView setTopicListModel:_topicListModel viewType:TopicContentViewImage];
    }
    else if([reuseIdentifier isEqualToString:@"textIdf"])
    {
        [_topicView setTopicListModel:_topicListModel viewType:TopicContentViewText];
    }
    else
    {
        [_topicView setTopicListModel:_topicListModel viewType:TopicContentViewMusic];
    }
    _bottomLabel.leftLabel.text = _topicListModel.addtime_f;
    _bottomLabel.rightLabel.text = [NSString stringWithFormat:@"comments:%d", _topicListModel.counterList.comment];
}

@end
