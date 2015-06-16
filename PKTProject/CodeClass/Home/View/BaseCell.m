//
//  BaseCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/15.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "BaseCell.h"

#import "BaseModel.h"

@implementation BaseCell

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
        //设置姓名标签
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH - 40, 20)];
//        _nameLabel.backgroundColor = [UIColor redColor];
        _nameLabel.font = [UIFont systemFontOfSize:10.0];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

- (void)setName:(NSString *)name withEnName:(NSString *)enName
{
    NSString *str = [NSString stringWithFormat:@"%@ · %@", name, enName];
    _nameLabel.text = str;
}

@end
