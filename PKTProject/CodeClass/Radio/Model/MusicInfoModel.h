//
//  MusicInfoModel.h
//  PKTProject
//
//  Created by guanxiaobai on 15/6/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>

//音乐信息
@class PlayInfoModel;

@interface MusicInfoModel : NSObject

@property (nonatomic, strong) NSString *coverimg; //封面
@property (nonatomic, strong) NSString *title;    //标题
@property (nonatomic, strong) NSString *tingid;   //
@property (nonatomic, strong) NSString *musicVisit; //音乐播放次数
@property (nonatomic, strong) NSString *musicUrl;  //音乐url

@property (nonatomic, strong) PlayInfoModel *playInfo; //音乐播放信息

@property (nonatomic, assign) BOOL isnew; //是否是新上传的,是：左上角有一个new标志

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (id)valueForUndefinedKey:(NSString *)key;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)musicInfoWithDictionary:(NSDictionary *)dic;

@end
