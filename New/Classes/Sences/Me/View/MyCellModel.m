//
//  MyCellModel.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyCellModel.h"

@implementation MyCellModel
+(instancetype)MyCellModelWithIconName:(NSString *)iconName TitleName:(NSString *)titleName{
    MyCellModel *mycell = [[MyCellModel alloc]init];
    mycell.icon = iconName;
    mycell.title = titleName;
    return mycell;
}
@end
