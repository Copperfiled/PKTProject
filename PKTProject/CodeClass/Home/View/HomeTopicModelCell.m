//
//  HomeTopicModelCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "HomeTopicModelCell.h"
#import "UIImageView+WebCache.h"

#import "HomeTopicModel.h"

@implementation HomeTopicModelCell

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
        //title
        //250
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, SCREEN_WIDTH - 40, 40)];
//        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [self.contentView addSubview:_titleLabel];
        
        _coverImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 70, SCREEN_WIDTH - 40, 150)];
        [self.contentView addSubview:_coverImgView];
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, SCREEN_WIDTH - 40, 40)];
//        _contentLabel.backgroundColor = [UIColor blueColor];
        _contentLabel.font = [UIFont systemFontOfSize:12.0];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        _likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, SCREEN_WIDTH - 40, 20)];
//        _likeLabel.backgroundColor = [UIColor grayColor];
        _likeLabel.textAlignment = NSTextAlignmentRight;
        _likeLabel.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:_likeLabel];
    }
    return self;
}

- (void)setBaseModel:(BaseModel *)baseModel
{
    if (self.baseModel != baseModel) {
        HomeTopicModel *model = (HomeTopicModel *)baseModel;
        
        [self setName:model.name withEnName:model.enname];
        _titleLabel.text = model.title;
        [_coverImgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
        _contentLabel.text = model.content;
        _likeLabel.text = [model.like stringValue];
    }
}

@end
