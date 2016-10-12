//
//  MyCellModel.h
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^OptionBlock)();
@interface MyCellModel : NSObject
@property (copy,nonatomic) NSString *icon;// 头像
@property (copy,nonatomic) NSString *title; // 标题
@property (copy,nonatomic) OptionBlock options; // 功能BlocK
@property (copy,nonatomic) NSString *detailTitle;
+(instancetype)MyCellModelWithIconName:(NSString *)iconName TitleName:(NSString *)titleName;
@end
