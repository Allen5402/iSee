//
//  NewsUrl.h
//  New
//
//  Created by nattinessYang on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#ifndef NewsUrl_h
#define NewsUrl_h

#pragma mark - 新闻列表
// 头条
#define NEWS_HEADLINE_URL @"http://c.m.163.com/nc/article/headline/T1348647909107/%d-20.html"
// 娱乐
#define NEWS_ENTERTAINMENT_URL @"http://c.m.163.com/nc/article/list/T1348648517839/%d-20.html"
// 时尚
#define NEWS_FASHION_URL @"http://c.3g.163.com/nc/article/list/T1348650593803/%d-20.html"
// 体育
#define NEWS_SPORT_URL @"http://c.m.163.com/nc/article/list/T1348649079062/%d-20.html"
// 科技
#define NEWS_TECHNOLOGY_URL @"http://c.m.163.com/nc/article/list/T1348649580692/%d-20.html"

#pragma mark - 新闻详情
// photoset
#define NEWS_PHOTOSET_DETAIL_URL(newsType, newsID) [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@/%@.json", newsType, newsID]
// article
#define NEWS_ARTICLE_DETAIL_URL(postid) [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html", postid]
// special
#define NEWS_SPECIAL_DETAIL_URL(skipID) [NSString stringWithFormat:@"http://c.m.163.com/nc/special/%@.html", skipID]

#endif /* NewsUrl_h */
