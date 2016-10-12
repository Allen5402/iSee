//
//  MyArrowCellModel.h
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MyCellModel.h"

@interface MyArrowCellModel : MyCellModel
@property (assign,nonatomic) Class destination; // 目标控制器属性
+(instancetype)MyCellModelWithIconName:(NSString *)iconName TitleName:(NSString *)titleName destination:(Class)destinationVC;

@end
