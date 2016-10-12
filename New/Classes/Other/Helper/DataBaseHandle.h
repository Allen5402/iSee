//
//  DataBaseHandle.h
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <AVOSCloud.h>
#import "News.h"


@interface DataBaseHandle : NSObject

#pragma mark - 声明单例 
singleton_interface(DataBaseHandle)

#pragma mark - News转换成AVObject
- (AVObject *)newsToAVObject:(News *)news;
#pragma mark - AVObject转换成转换成
- (News *)aVObjectToNews:(AVObject *)object;

@end
