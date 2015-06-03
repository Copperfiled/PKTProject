//
//  PKTRequestManager.m
//  LessonNet
//
//  Created by young on 15/5/30.
//  Copyright (c) 2015年 cq. All rights reserved.
//

#import "PKTRequestManager.h"
#import "APIHeader.h"

//宏
//接口基本链接


@implementation PKTRequestManager


//实现方法
+ (void)postRequestWithURL:(NSString *)urlStr
                 paramters:(NSDictionary *)paramters
              finshedBlock:(FinishBlock)block{
    
    PKTRequestManager *requestManager =[PKTRequestManager new];

    requestManager.finishBlock = block;
    //拼接接口
    NSString *str =[NSString stringWithFormat:@"%@%@",PKAPI,urlStr];
    //转化 url
    NSURL *url = [NSURL URLWithString:str];
    
    //使用 NSMutableURLRequest 创建对象
    //NSURLRequest 是一个不可变的请求，默认执行的就是GET请求。也就是说，通过NSURLRequest无法指定 请求方式为 POST，因为TA是不可变的。
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    [request setHTTPMethod:@"POST"];
    
    //准备发送的字符串
    NSString *postStr = @"";
    //取出post参数中所有key
    NSArray *keyArray = [paramters allKeys];
    //遍历 拼接参数的字符串
    for (NSString *keyString in keyArray) {
        
        postStr = [NSString stringWithFormat:@"%@&%@=%@",postStr,keyString,[paramters objectForKey:keyString]];
        
    }
    
    [request setHTTPBody:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:requestManager];
    NSLog(connection ? @"网络连接创建成功" : @"网络连接连接创建失败");

}

/**
 *  接收到服务器回应的时回调
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (!self.resultData) {
        self.resultData = [[NSMutableData alloc]init];
    } else {
        [self.resultData setLength:0];
    }
    
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *dic = [httpResponse allHeaderFields];
        NSLog(@"network---Header:%@",[dic description]);
    }
}
/**
 *  接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.resultData appendData:data];
}
/**
 *  数据传完之后调用此方法
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.resultData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"解析错误");
        self.finishBlock(nil);
    }
    
    if (self.finishBlock) {
        self.finishBlock(dic);
    }
}
/**
 *  网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
 */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"network error : %@", [error localizedDescription]);
    
    //这个地方可以防止Block空执行
    if (self.finishBlock) {
        self.finishBlock(nil);
    }
}


@end

