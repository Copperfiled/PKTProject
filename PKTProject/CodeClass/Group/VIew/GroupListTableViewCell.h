//
//  GroupListTableViewCell.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/3.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLCustomView;

@class GroupListModel;

@protocol GroupListTableViewCellDelegate <NSObject>

- (void)cellSketchViewContentid:(NSString *)contentid;

@end

@interface GroupListTableViewCell : UITableViewCell

@property (nonatomic, readonly, strong) UIView *topView;
@property (nonatomic, readonly, strong) UIView *middleView;
@property (nonatomic, readonly, strong) UIView *bottomView;

@property (nonatomic, readonly, strong) UIImageView *headImgView;
@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) LLCustomView *tagLabel;

@property (nonatomic, strong) GroupListModel *groupListModel;
@property (nonatomic, assign) id<GroupListTableViewCellDelegate> delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(GroupListModel *)model;

@end
