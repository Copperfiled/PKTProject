//
//  HomeTimeLineModelCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/16.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "HomeTimeLineModelCell.h"

#import "LLCustomView.h"
#import "UIImageView+WebCache.h"
#import "HomeTimeLineModel.h"
#import "TagInfoModel.h"

@implementation HomeTimeLineModelCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//图片 + content, 如果有tag则显示，否则不显示
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //image view
        _coverImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH - 40, 200)];
        _coverImgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_coverImgView];
        
        //content
        CGRect coverRect = _coverImgView.frame;
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, coverRect.origin.y + coverRect.size.height, SCREEN_WIDTH - 40, 40)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_contentLabel];
        
        //tag and like
        CGRect contentRect = _contentLabel.frame;
        _tagAndLikeLabel = [[LLCustomView alloc]initWithFrame:CGRectMake(20, contentRect.origin.y + contentRect.size.height + 10, SCREEN_WIDTH - 40, 40)];
        _tagAndLikeLabel.leftLabel.font = [UIFont systemFontOfSize:10.0];
        _tagAndLikeLabel.rightLabel.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:_tagAndLikeLabel];
    }
    return self;
}
- (void)setBaseModel:(BaseModel *)baseModel
{
    if (self.baseModel != baseModel) {
        HomeTimeLineModel *model = (HomeTimeLineModel *)baseModel;
        
        [self setName:model.name withEnName:model.enname];
        //cover image view
        [_coverImgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
        
        //content
        _contentLabel.text = model.content;
        
        //tag and like
        NSString *tagStr = @"";
        NSLog(@"%s, tag = %@", __FUNCTION__, model.tag_info);
        if (model.tag_info.tag.length) {
            tagStr = [NSString stringWithFormat:@"·%@·%d条", model.tag_info.tag, model.tag_info.count];
        }
        _tagAndLikeLabel.leftLabel.text = tagStr;
        _tagAndLikeLabel.rightLabel.text = [model.like stringValue];
    }
}

@end
