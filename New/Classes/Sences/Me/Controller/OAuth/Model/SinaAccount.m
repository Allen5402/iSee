//
//  SinaAccount.m
//  New
//
//  Created by lanou3g on 16/8/22.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "SinaAccount.h"

@implementation SinaAccount
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    SinaAccount *account = [[SinaAccount alloc]init];
    [account setValuesForKeysWithDictionary:dict];
//    account.access_token = dict[@"access_token"];
//    account.uid = dict[@"uid"];
//    account.expires_in = dict[@"expires_in"];
//    account.remind_in = dict[@"remind_in"];
    
    return account;
}
+(instancetype)SinaAccountWith:(NSDictionary *)dict{
    return [[SinaAccount alloc]initWithDictionary:dict];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
#pragma mark - 归档方法
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeObject:_remind_in forKey:@"remind_in"];
    [aCoder encodeObject:_expires_in forKey:@"expires_in"];
    [aCoder encodeObject:_uid forKey:@"uid"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        _remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
    }return self;
}
@end
