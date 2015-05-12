//
//  AdtUser.h
//  QiYReader
//
//  Created by 奇阅科技 on 14-11-15.
//  Copyright (c) 2014年 奇阅科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdtUser : NSObject<NSCoding>

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *headimg;
///可提现金额
@property (nonatomic, strong) NSString *can_carry;
///昨日收益
@property (nonatomic, strong) NSString *profilt_accumulated;
///总资产
@property (nonatomic, strong) NSString *profit_yestoday;
///累计收益
@property (nonatomic, strong) NSString *total_assets;

@property (nonatomic, strong) NSString *user_type;
@property (nonatomic, strong) NSString *student_school_name;
@property (nonatomic, strong) NSString *student_school_address;
@property (nonatomic, strong) NSString *student_class_name;
@property (nonatomic, strong) NSString *student_admission_time;
@property (nonatomic, strong) NSString *student_school_roll_screenshot;
@property (nonatomic, strong) NSString *student_student_id_photo;
@property (nonatomic, strong) NSString *worker_company_name;
@property (nonatomic, strong) NSString *worker_company_address;
@property (nonatomic, strong) NSString *worker_position;
@property (nonatomic, strong) NSString *worker_home_address;
@property (nonatomic, strong) NSString *worker_accumulation_fund_account;
@property (nonatomic, strong) NSString *worker_accumulation_fund_password;
@property (nonatomic, strong) NSString *worker_ssp;
@property (nonatomic, strong) NSString *worker_employees_card;
@property (nonatomic, strong) NSString *id_card_photo;
//+(AdtUser *)getFromDict:(NSDictionary *)dict;
@end
