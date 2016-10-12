//
//  MyCellModelGroup.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyCellModelGroup.h"

@implementation MyCellModelGroup
+(instancetype)MyCellModelGrounpWithHeaderTitle:(NSString *)headerTitle FooterTitle:(NSString *)footerTitler{
    MyCellModelGroup *mycellModelGroup = [[MyCellModelGroup alloc]init];
    mycellModelGroup.headerTitle = headerTitle;
    mycellModelGroup.footerTitle = footerTitler;
    return mycellModelGroup;
}
@end
