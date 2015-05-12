//
//  UserAccount.h
//  QiYReader
//
//  Created by 奇阅科技 on 14-11-15.
//  Copyright (c) 2014年 奇阅科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdtUser.h"
@interface UserAccount : AdtUser
+ (UserAccount *)currentAccount;
+ (void)removeAccount;
+ (void)saveAccount:(UserAccount *)account;
+ (UserAccount *)getFromDict:(NSDictionary *)dict;
@end
