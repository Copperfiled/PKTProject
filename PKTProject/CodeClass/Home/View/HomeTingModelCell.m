//
//  HomeTingModelCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "HomeTingModelCell.h"

#import "UIImageView+WebCache.h"
#import "HomeTingModel.h"
#import "UserInfoModel.h"

@implementation HomeTingModelCell

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
        //背景图片
        _coverImgView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 30, SCREEN_WIDTH - 80, 150)];
//        _coverImgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_coverImgView];
        
        //title
        CGRect coverRect = _coverImgView.frame;
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40 + 20, coverRect.origin.y + coverRect.size.height + 20, SCREEN_WIDTH - 40 * 2 - 20 * 2, 40)];
//        _titleLabel.backgroundColor = [UIColor greenColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [self.contentView addSubview:_titleLabel];
        
        //user
        CGRect titleRect = _titleLabel.frame;
        _userLabel = [[UILabel alloc]initWithFrame:CGRectMake(40 + 20 + 40, titleRect.origin.y + titleRect.size.height, SCREEN_WIDTH - 40 * 2 - 20 * 2 - 40 * 2, 20)];
        _userLabel.textAlignment = NSTextAlignmentCenter;
        _userLabel.font = [UIFont systemFontOfSize:12.0];
//        _userLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_userLabel];
        
        //like
        _likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 290 - 40, SCREEN_WIDTH - 40, 40)];
        _likeLabel.textAlignment = NSTextAlignmentRight;
        _likeLabel.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:_likeLabel];
    }
    return self;
}

- (void)setBaseModel:(BaseModel *)baseModel
{
    if (self.baseModel != baseModel) {
        
        HomeTingModel *model = (HomeTingModel *)baseModel;
        //name
        [self setName:model.name withEnName:model.enname];

        //cover image
        [_coverImgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
        
        //title
        _titleLabel.text = model.title;
        
        //user
        _userLabel.text = [NSString stringWithFormat:@"by：%@", model.userinfo.uname];
        
        //like
        _likeLabel.text = [model.like stringValue];
    }
}

@end
