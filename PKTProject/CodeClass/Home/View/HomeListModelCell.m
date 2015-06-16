//
//  HomeListModelCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "HomeListModelCell.h"

#import "HomeListModel.h"

//第三方
#import "UIImageView+WebCache.h"

@implementation HomeListModelCell

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
        //总长度为250
        
        //设置背景图片
        _coverImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height, SCREEN_WIDTH - 40, 150)];
//        _coverImgView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_coverImgView];
        
        //设置标题
        CGRect coverRect = _coverImgView.frame;
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(coverRect.origin.x, coverRect.origin.y + coverRect.size.height, SCREEN_WIDTH - 40, 40)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
//        _titleLabel.backgroundColor = [UIColor cyanColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLabel];
        
        //设置内容
        CGRect titleRect = _titleLabel.frame;
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(titleRect.origin.x, titleRect.origin.y + titleRect.size.height + 10, SCREEN_WIDTH - 40, 40)];
        [self.contentView addSubview:_contentLabel];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:12.0];
//        _contentLabel.backgroundColor = [UIColor blueColor];
        
        //设置喜欢
        CGRect contentRect = _contentLabel.frame;
        _likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(contentRect.origin.x, contentRect.origin.y + contentRect.size.height, SCREEN_WIDTH - 40, 40)];
        _likeLabel.textAlignment = NSTextAlignmentRight;
        _likeLabel.font = [UIFont systemFontOfSize:10.0];
//        _likeLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_likeLabel];
    }
    return self;
}

- (void)setBaseModel:(BaseModel *)baseModel
{
    if (self.baseModel != baseModel) {
        
        HomeListModel *homeModel = (HomeListModel *)baseModel;
        
        //设置姓名
        [self setName:homeModel.name withEnName:homeModel.enname];
        
        //设置图片
        [_coverImgView sd_setImageWithURL:[NSURL URLWithString:homeModel.coverimg]];
        
        //设置title
        _titleLabel.text = homeModel.title;
        
        //设置内容
        _contentLabel.text = homeModel.content;
        
        //设置喜欢
        _likeLabel.text = [homeModel.like stringValue];
    }
}

@end
