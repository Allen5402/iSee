//
//  TopicQuestion.h
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicQuestion : NSObject

@property (copy,nonatomic) NSString *userName;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *userHeadPicUrl;
@property (assign,nonatomic) NSInteger cTime;

/**cell的高度*/
@property (assign,nonatomic) CGFloat cellHeight;

@end
