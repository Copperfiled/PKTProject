//
//  HomePhotoModelCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "HomePhotoModelCell.h"

//model
#import "HomePhotoModel.h"

//the third
#import "UIImageView+WebCache.h"

@implementation HomePhotoModelCell

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
        //cover image view
        _coverImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH - 40, 150)];
//        _coverImgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_coverImgView];
        
        //left image view
        CGRect coverRect = _coverImgView.frame;
        _leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(coverRect.origin.x, coverRect.origin.y + coverRect.size.height + 10, (SCREEN_WIDTH - 40 - 10) / 2, (SCREEN_WIDTH - 40 - 10) / 2)];
//        _leftImgView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_leftImgView];
        
        //right
        CGRect leftRect = _leftImgView.frame;
        _rightImgView = [[UIImageView alloc]initWithFrame:CGRectMake(coverRect.origin.x + leftRect.size.width + 10, coverRect.origin.y + coverRect.size.height + 10, (SCREEN_WIDTH - 40 - 10) / 2, (SCREEN_WIDTH - 40 - 10) / 2)];
//        _rightImgView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_rightImgView];
        
        //countLabel
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 30, leftRect.origin.y + leftRect.size.height - 30, 30, 30)];
        _countLabel.font = [UIFont systemFontOfSize:12.0];
        _countLabel.backgroundColor = [UIColor grayColor];
        _countLabel.alpha = 0.5;
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_countLabel];
        
        //title
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, leftRect.origin.y + leftRect.size.height, SCREEN_WIDTH - 40, 80)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
//        _titleLabel.backgroundColor = [UIColor yellowColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [self.contentView addSubview:_titleLabel];
        
        //content
        CGRect titleRect = _titleLabel.frame;
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, titleRect.origin.y + titleRect.size.height, SCREEN_WIDTH - 40, 80)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:12.0];
        _contentLabel.textColor = [UIColor grayColor];
//        _contentLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_contentLabel];
        
        //like
        CGRect contentRect = _contentLabel.frame;
        _likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, contentRect.origin.y + contentRect.size.height + 10, SCREEN_WIDTH - 40, 40)];
        _likeLabel.font = [UIFont systemFontOfSize:12.0];
        _likeLabel.textAlignment = NSTextAlignmentRight;
        _likeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_likeLabel];
        
    }
    return self;
}

- (void)setBaseModel:(BaseModel *)baseModel
{
    if (self.baseModel != baseModel) {
        HomePhotoModel *model = (HomePhotoModel *)baseModel;
        
        //name
        [self setName:model.name withEnName:model.enname];
        //cover
        [_coverImgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
        
        //得到imageList
        [_leftImgView sd_setImageWithURL:[NSURL URLWithString:[model.imglist[1] objectForKey:@"imgurl"]]];
        [_rightImgView sd_setImageWithURL:[NSURL URLWithString:[model.imglist[2] objectForKey:@"imgurl"]]];
        //count label
        _countLabel.text = [model.imgtotal stringValue];
        
        //title
        _titleLabel.text = model.title;
        //content
        _contentLabel.text = model.content;
        //like
        _likeLabel.text = [model.like stringValue];
    }
}

@end
