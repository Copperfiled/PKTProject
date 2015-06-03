//
//  GroupListTableViewCell.m
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "GroupListTableViewCell.h"

#import "GroupListModel.h"

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
        //
    }
    return self;
}

@end
