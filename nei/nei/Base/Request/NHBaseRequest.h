//
//  NHBaseRequest.h
//  nei
//
//  Created by ChenZuo on 2016/11/4.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NHBaseRequestReponseDelegate <NSObject>
@required
/*
 @required 表示必须要实现
 @optional 表示可以选择实现的方法
 */
- (void)requestSuccessReponse:(BOOL)success response:(id)response message:(NSString *)message;
@end
/** 如果不用block返回数据的话，这个方法必须实现*/
typedef void(^NHAPIDicComletion)(id response, BOOL success, NSString * message);

@interface NHBaseRequest : NSObject
@property(weak, nonatomic)id <NHBaseRequestReponseDelegate> nh_delegate;
/** 链接*/
@property(copy, nonatomic)NSString * nh_url;
/** 默认GET*/
@property(nonatomic, assign) BOOL nh_isPost;
/** 图片数组*/
@property(nonatomic,strong) NSArray <UIImage *>* nh_imageArray;

/** 构造方法*/
+ (instancetype)nh_request;
+ (instancetype)nh_requestWithUrl:(NSString *)url;
+ (instancetype)nh_requestWithUrl:(NSString *)url isPost:(BOOL)nh_isPost;
+ (instancetype)nh_requestWithUrl:(NSString *)url isPost:(BOOL)nh_isPost delegate:(id <NHBaseRequestReponseDelegate>)nh_delegate;

/** 开始请求，如果设置了代理，不需要block回调*/
- (void)nh_sendRequest;
/** 开始请求，没有设置代理，或者设置了代理，需要block回调，block回调优先级高于代理*/
- (void)nh_sendRequestWithCompletion:(NHAPIDicComletion)completion;
@end
