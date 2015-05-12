//
//  UserAccount.m
//  QiYReader
//
//  Created by 奇阅科技 on 14-11-15.
//  Copyright (c) 2014年 奇阅科技. All rights reserved.
//

#import "UserAccount.h"
#import "PathHelper.h"
static UserAccount *account;
@implementation UserAccount
+ (NSString *)getAccountsStoragePath {
    return [[PathHelper documentDirectoryPathWithName:@"db"]
            stringByAppendingPathComponent:@"accounts"];
}

+ (void)loadAccount {
    account = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getAccountsStoragePath]];
}

+ (void)saveAccount:(UserAccount *)acc {
    [NSKeyedArchiver archiveRootObject:acc toFile:[self getAccountsStoragePath]];
    account = acc;
}
-(instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}
+ (void)removeAccount {
    @synchronized(self) {
        if (account) {
            account = nil;
            [self saveAccount:account];
        }
    }
}

+ (UserAccount *)currentAccount {
    @synchronized(self) {
        if (!account) {
            [self loadAccount];
        }
    }
    return account;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self != nil) {
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [super encodeWithCoder:encoder];
}
+(UserAccount *)getFromDict:(NSDictionary *)dict{
    UserAccount *user = [UserAccount new];
    user.uid = [dict objectForKey:@"uid"];
    user.name = [dict objectForKey:@"name"];
    user.mobile = [dict objectForKey:@"phone"];
    user.status = [dict objectForKey:@"status"];
    user.headimg = [dict objectForKey:@"avatar"];
    NSDictionary *amount = [dict objectForKey:@"amount"];
    if (amount) {
        user.can_carry = [amount objectForKey:@"can_carry"];
        user.profilt_accumulated = [amount objectForKey:@"profilt_accumulated"];
        user.profit_yestoday = [amount objectForKey:@"profit_yestoday"];
        user.total_assets = [amount objectForKey:@"total_assets"];
        
    }
    return user;
}
@end
