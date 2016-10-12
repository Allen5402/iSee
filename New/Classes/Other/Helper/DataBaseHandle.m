//
//  DataBaseHandle.m
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "DataBaseHandle.h"

@implementation DataBaseHandle

#pragma mark - News转换成AVObject
- (AVObject *)newsToAVObject:(News *)news {
    AVObject *ob = [[AVObject alloc] initWithClassName:@"News"];
    [ob setObject:news.postid forKey:@"postid"];
    [ob setObject:news.title forKey:@"title"];
    [ob setObject:news.skipID forKey:@"skipID"];
    [ob setObject:news.skipType forKey:@"skipType"];
    [ob setObject:news.imgsrc forKey:@"imgsrc"];
    [ob setObject:news.source forKey:@"source"];
    [ob setObject:news.imgextra forKey:@"imgextra"];
    [ob setObject:[AVUser currentUser].username forKey:@"username"];
    return ob;
}

#pragma mark - AVObject转换成转换成News
- (News *)aVObjectToNews:(AVObject *)object {
    News *news = [[News alloc] init];
    news.postid = [object objectForKey:@"postid"];
    news.title = [object objectForKey:@"title"];
    news.skipID = [object objectForKey:@"skipID"];
    news.skipType = [object objectForKey:@"skipType"];
    news.imgextra = [object objectForKey:@"imgextra"];
    news.source = [object objectForKey:@"source"];
    news.imgsrc = [object objectForKey:@"imgsrc"];
    return news;
}

@end
