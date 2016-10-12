//
//  MeViewCell.h
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCellModel.h"
@interface MeViewCell : UITableViewCell
@property (strong,nonatomic) MyCellModel *itemModel;
+(instancetype)MeViewCellWithTableView:(UITableView *)tableview;
@end
