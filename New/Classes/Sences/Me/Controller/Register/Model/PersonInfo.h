//
//  PersonInfo.h
//  New
//
//  Created by lanou3g on 16/8/16.
//  Copyright © 2016年 nattinessYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonInfo : NSObject<NSCoding>
@property (copy,nonatomic) NSString *userName;
@property (copy,nonatomic) NSString *password;
@property (copy,nonatomic) NSString *emailAddress;
@property (copy,nonatomic) NSString *birthday;
+(instancetype)PersonInfoWithUserName:(NSString *)userName Password:(NSString *)password EmailAddress:(NSString *)emailAddress Birthday:(NSString *)birthday;
@end
