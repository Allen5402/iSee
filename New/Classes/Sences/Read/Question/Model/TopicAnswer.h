//
//  TopicAnswer.h
//  New
//
//  Created by allen on 16/8/13.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicAnswer : NSObject

@property (copy,nonatomic) NSString *specialistName;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *specialistHeadPicUrl;
@property (assign,nonatomic) NSInteger cTime;

/**cell的高度*/
@property (assign,nonatomic) CGFloat cellHeight;

@end
