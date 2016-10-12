//
//  MyArrowCellModel.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyArrowCellModel.h"

@implementation MyArrowCellModel
+(instancetype)MyCellModelWithIconName:(NSString *)iconName TitleName:(NSString *)titleName destination:(Class)destinationVC{
    MyArrowCellModel *arrowCellModel = [[MyArrowCellModel alloc]init];
    arrowCellModel.icon = iconName;
    arrowCellModel.title = titleName;
    arrowCellModel.destination = destinationVC;
    return arrowCellModel;
}
@end
