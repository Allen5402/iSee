//
//  MySwitchCellModel.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MySwitchCellModel.h"

@implementation MySwitchCellModel
+(instancetype)MyCellModelWithIconName:(NSString *)iconName TitleName:(NSString *)titleName{
    MySwitchCellModel *mycell = [[MySwitchCellModel alloc]init];
    mycell.icon = iconName;
    mycell.title = titleName;
    return mycell;
}
@end
