//
//  PersonInfo.m
//  New
//
//  Created by lanou3g on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import "PersonInfo.h"

@implementation PersonInfo
+(instancetype)PersonInfoWithUserName:(NSString *)userName Password:(NSString *)password EmailAddress:(NSString *)emailAddress Birthday:(NSString *)birthday{
    PersonInfo *perInfo = [[PersonInfo alloc]init];
    perInfo.userName = userName;
    perInfo.password = password;
    perInfo.emailAddress= emailAddress;
    perInfo.birthday = birthday;
    return perInfo;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeObject:_emailAddress forKey:@"emailAddress"];
    [aCoder encodeObject:_birthday forKey:@"birthday"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.emailAddress = [aDecoder decodeObjectForKey:@"emailAddress"];
        self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
    }return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_birthday];
}
@end
