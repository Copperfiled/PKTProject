//
//  PKTRequestManager.h
//  LessonNet
//
//  Created by young on 15/5/30.
//  Copyright (c) 2015年 cq. All rights reserved.
//

/**
 * 因为项目中几乎每个地方都用到了网络请求 所以可以把网络请求封装一个模块出来
 *(多个地方用到的某个功能 都可以单独抽出来抽出来 做个功能模块)  <封装>
 *
 */


#import <Foundation/Foundation.h>

//声明一个 blcok 属性 用来传值
//finishBlcok 把请求完毕 解析好的数据传出来  id 可以代表任意类型
//解析为系统的 json 解析   现在外面一般基本全是json

typedef void (^FinishBlock)(id dataResponse);

@interface PKTRequestManager : NSObject<NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *resultData;

@property (nonatomic, strong)FinishBlock finishBlock;


/**
 *  post 类方法
 *
 *  @param urlStr    接口参数  内部设计了接口基本链接的宏 只传后面跟的接口参数
 *  @param paramters 需要传的参数
 *  @param block     返回值
 */
+ (void)postRequestWithURL:(NSString *)urlStr
                 paramters:(NSDictionary *)paramters
              finshedBlock:(FinishBlock)block;

@end
