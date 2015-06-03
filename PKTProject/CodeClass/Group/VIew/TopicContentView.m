//
//  TopicContentView.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "TopicContentView.h"
#import "GroupTopicListModel.h"

#import "UIImageView+WebCache.h"
#import "UIImage+AllColor.h"

@implementation TopicContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame viewType:(enum TopicContentViewType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        _type = type;
        CGSize size = frame.size;
//        self.backgroundColor = [UIColor blueColor];
        switch (type) {
            case TopicContentViewText:
            {
                //only text
                _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, size.width - 40, size.height)];
                _textLabel.textAlignment = NSTextAlignmentLeft;
                _textLabel.numberOfLines = 3;
//                _textLabel.backgroundColor = [UIColor redColor];
                [self addSubview:_textLabel];
            }
            break;
                case TopicContentViewImage:
            {
                //text and image
                _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 70, size.height - 20)];
                _imageView.backgroundColor = [UIColor blueColor];
                [self addSubview:_imageView];
                
                _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame) + 10, 10, size.width - 100, size.height - 30)];
                _textLabel.numberOfLines = 3;
                [self addSubview:_textLabel];
            }
                break;
            case TopicContentViewMusic:
            {
                //text and image
                _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 60, size.height - 20)];
                _imageView.backgroundColor = [UIColor blueColor];
                [self addSubview:_imageView];
                
                _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame) + 10, 10, size.width - 100, size.height - 30)];
                _textLabel.numberOfLines = 3;
                [self addSubview:_textLabel];
                //text and image and music icon
                _iconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
                _iconImgView.center = _imageView.center;
                _iconImgView.image = [UIImage imageNamed:@"topic_music_icon.png"];
                [self addSubview:_iconImgView];
            }
                
            default:
                break;
        }
    }
    return self;
}
- (void)setTopicListModel:(GroupTopicListModel *)topicListModel viewType:(enum TopicContentViewType)type
{
    _textLabel.text = topicListModel.content;
    _textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    _textLabel.textColor = [UIColor grayColor];
    NSLog(@"%@", topicListModel.coverimg);
    if (type == TopicContentViewImage || type == TopicContentViewMusic) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:topicListModel.coverimg] placeholderImage:[UIImage createImageWithColor:[UIColor blackColor]]];
    }
}

@end
