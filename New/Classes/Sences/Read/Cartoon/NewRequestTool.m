//
//  NewRequestTool.m
//  ComicReader
//
//  Created by Jiang on 3/25/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import "NewRequestTool.h"
#import "AFNetworking.h"
#import "GetRequestUrlTool.h"
#import "Header.h"
@implementation NewRequestTool

- (void)requestTitleModelCompletion:(void (^)(NSDictionary *))success
                            failure:(void (^)(NSError *))failure{
    
    NSString *requestURL = @"http://api.kuaikanmanhua.com/v1/tag/suggestion";
    [[AFHTTPSessionManager manager] GET:requestURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:requestURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
}

- (void)requestContentListModelCompletion:(NSString*)requestMethod
                               parameters:(id)parameters
                                  success:(void (^)(NSMutableArray *))success
                                  failure:(void (^)(NSError *))failure{
    
    NSString *urlString = [GetRequestUrlTool getNEWStoreContentListUrl:requestMethod];
    [[AFHTTPSessionManager manager] GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([requestMethod isEqualToString:kNewListContentMethod]) {
            success(responseObject[@"Booklist"]);
        }else{
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
}
    

#pragma mark - 单例实现
static NewRequestTool *_instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)sharedRequestTool{
    _instance = [[NewRequestTool alloc]init];
    return _instance;
}
@end