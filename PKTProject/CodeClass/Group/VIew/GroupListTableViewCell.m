//
//  GroupListTableViewCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "GroupListTableViewCell.h"

#import "GroupListModel.h"
#import "UIImageView+WebCache.h"
#import "LLCustomView.h"

#import "TopicSketchModel.h"

@interface GroupListTableViewCell ()

- (void)setTopView;
- (void)setMiddleView;
- (void)setBottomView;

@end

@implementation GroupListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(GroupListModel *)model
{
    self = [super init];
    if (self) {
        _groupListModel = model;
        //init the views
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
//        _topView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_topView];
        
        _middleView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 80)];
//        _middleView.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_middleView];
        
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 180, SCREEN_WIDTH, 40)];
//        _bottomView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_bottomView];
        [self setTopView];
        [self setMiddleView];
        [self setBottomView];
    }
    return self;
}

//设置头视图
- (void)setTopView
{
    _headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
    [_headImgView sd_setImageWithURL:[NSURL URLWithString:_groupListModel.coverimg]];
    _headImgView.layer.masksToBounds = YES;
    _headImgView.layer.cornerRadius = 30;
    [_topView addSubview:_headImgView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, SCREEN_WIDTH - 100, 40)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.text = _groupListModel.title;
//    _titleLabel.backgroundColor = [UIColor cyanColor];
    [_topView addSubview:_titleLabel];
    
    _tagLabel = [[LLCustomView alloc]initWithFrame:CGRectMake(100, 60, SCREEN_WIDTH - 100, 40)];
//    _tagLabel.backgroundColor = [UIColor purpleColor];
    NSString *tagString = _groupListModel.tags[0];
    for (int i = 1; i < _groupListModel.tags.count; ++i) {
        tagString = [NSString stringWithFormat:@"%@/%@",tagString, _groupListModel.tags[i]];
    }
    _tagLabel.leftLabel.text = tagString;
    _tagLabel.leftLabel.textColor = [UIColor grayColor];
    _tagLabel.leftLabel.textColor = [UIColor grayColor];
    _tagLabel.leftLabel.font = [UIFont systemFontOfSize:12];
    _tagLabel.rightLabel.font = [UIFont systemFontOfSize:12];
    _tagLabel.rightLabel.text = [NSString stringWithFormat:@"%@人加入", _groupListModel.membernum];
    [_topView addSubview:_tagLabel];
}
//设置中间的网格图片
- (void)setMiddleView
{
    NSArray *lastestPosts = _groupListModel.latestposts;
    int padding = 20;
    CGFloat width = (SCREEN_WIDTH - 2 * padding - 3 * 5) / 4.0;

    for (int i = 0; i < lastestPosts.count; ++i) {
        TopicSketchModel *sketchModel = _groupListModel.latestposts[i];
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(padding + width * i + i * 5, 0, width, width)];
//        imgView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnSketchImgView:)];
//        imgView.backgroundColor = [UIColor yellowColor];
//        [imgView addGestureRecognizer:tap];
        [_middleView addSubview:imgView];
        
        if (sketchModel.coverimg.length > 0) {
            //有图片就加载图片
            [imgView sd_setImageWithURL:[NSURL URLWithString:sketchModel.coverimg]];
            if (sketchModel.songid.length > 0) {
                //有音乐标识，则在添加音乐图片标识
                UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topic_music_icon.png"]];
                iconView.center = CGPointMake(imgView.center.x - 20, imgView.center.y);
                [imgView addSubview:iconView];
            }
        }
        else
        {
            //没有图片
            imgView.image = [UIImage createImageWithColor:[UIColor grayColor]];
            //标题
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, width - 20, width / 4)];
            titleLabel.font = [UIFont systemFontOfSize:15];
            titleLabel.text = sketchModel.title;
            [imgView addSubview:titleLabel];
            
            //内容
            UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5 + width / 4, width - 20, 3 * width / 4)];
            contentLabel.text = sketchModel.content;
            contentLabel.numberOfLines = 0;
            contentLabel.font = [UIFont systemFontOfSize:10];
            [imgView addSubview:contentLabel];
        }
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn addTarget:self action:@selector(tapOnSketchImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor clearColor];
        btn.frame = imgView.frame;
        btn.tag = i;
        [_middleView addSubview:btn];
    }
}
//设置底部视图
- (void)setBottomView
{
    LLCustomView *bottomContent = [[LLCustomView alloc]initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH - 40, CGRectGetHeight(_bottomView.frame))];
    bottomContent.leftLabel.text = [NSString stringWithFormat:@"组长:%@", _groupListModel.userinfo.uname];
    bottomContent.rightLabel.text = [NSString stringWithFormat:@"最近回复-%@", _groupListModel.lastupdate_f];
    bottomContent.leftLabel.font = [UIFont systemFontOfSize:12];
    bottomContent.rightLabel.font = [UIFont systemFontOfSize:12];
//    bottomContent.backgroundColor = [UIColor cyanColor];
    [_bottomView addSubview:bottomContent];
}

#pragma mark - tap action -
- (void)tapOnSketchImgViewAction:(UIButton *)btn
{
    NSInteger index = btn.tag;
    TopicSketchModel *model = _groupListModel.latestposts[index];
    if (_delegate && [_delegate respondsToSelector:@selector(cellSketchViewContentid:)]) {
        [_delegate cellSketchViewContentid:model.contentid];
    }
}

@end
