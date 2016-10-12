//
//  MyCellModelGroup.h
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCellModelGroup : NSObject
@property (copy,nonatomic) NSString *headerTitle; // 头部视图文字
@property (copy,nonatomic) NSString *footerTitle; // 尾部视图文字
@property (strong,nonatomic) NSArray *itemArray; // 分组内部的MyCellModel模型
+(instancetype)MyCellModelGrounpWithHeaderTitle:(NSString *)headerTitle FooterTitle:(NSString *)footerTitler;
@end
