//
//  MeViewCell.m
//  New
//
//  Created by lanou3g on 16/8/15.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "MeViewCell.h"
#import "MyArrowCellModel.h"
#import "MySwitchCellModel.h"
@interface MeViewCell ()
@property (strong,nonatomic) UISwitch *nightSW;
@end
@implementation MeViewCell
-(UISwitch *)nightSW{
    if (_nightSW == nil) {
        _nightSW = [[UISwitch alloc]init];
    }return _nightSW;
}
+(instancetype)MeViewCellWithTableView:(UITableView *)tableview{
    static NSString *MyCell = @"Mycell";
    MeViewCell *cell = [tableview dequeueReusableCellWithIdentifier:MyCell];
    if (cell == nil) {
        cell = [[MeViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyCell];

    }return cell;
}
-(void)setItemModel:(MyCellModel *)itemModel{
    _itemModel = itemModel;
    if (self.itemModel.icon) {
        self.imageView.image = [UIImage imageNamed:_itemModel.icon];
    }
    self.textLabel.text = _itemModel.title;
    self.detailTextLabel.text = _itemModel.detailTitle;
    self.nightSW.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"nightModel"];
    
    if ([self.itemModel isKindOfClass:[MyArrowCellModel class]] ) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([self.itemModel isKindOfClass:[MySwitchCellModel class]]){
        [self.nightSW addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
        self.accessoryView = self.nightSW;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else{
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}
-(void)valueChange{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:self.nightSW.isOn forKey:@"nightModel"];
}

@end
